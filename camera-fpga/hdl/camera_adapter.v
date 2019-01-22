module camera_adapter( pclk, cam_data, cam_vsync, cam_hsync, reset, output_data, write_en, compress_command );
input reset;
input pclk;
input[3:0] cam_data;
input cam_vsync, cam_hsync;
input[2:0] compress_command;

output reg write_en;
output reg[7:0] output_data;

reg frame_flag;
reg[3:0] buffer_state;
reg[1:0] repeat_counter;
reg[2:0] compress_mode;

/* only used in delta modulation */
reg[7:0] last_pixel;
reg[3:0] hi_nibble;
reg[7:0] pixel_idx;
reg lohalf;

/*
 * Camera Timing Diagram
 * VSYNC ____________|----------------------------------------------|___
 * HSYNC ____________________|-----------------------------------|______
 * PCLK  |_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|-|_|
 * COND       1      |   2   |               3                   | 2| 1
 */

/*
 * we are not considering full fifo. one possible solution is that we may add a "corrupted
 * frame" marker when the fifo full signal is positive. or we can adaptively adjust the
 * camera clock rate when we fifo is always getting stuffed. 
 */
 
always @(posedge pclk or negedge reset)
begin
    if (!reset)
    begin
        buffer_state <= 0;
        write_en <= 0;
        frame_flag <= 0;
        output_data <= 8'd0;
        repeat_counter <= 2'd0;
        compress_mode <= 3'd0;

        last_pixel <= 0;
        pixel_idx <= 0;
        lohalf <= 0;
        hi_nibble <= 0;
    end
    else
    /* pclk RISING edge */
    begin
        if (cam_vsync == 1)
        begin
            frame_flag <= 1;    // record that in this cycle vsync is valid

            if (frame_flag == 0)                
            // if vsync just rose
            begin
                buffer_state <= 0;
                compress_mode <= compress_command;  // register compress mode for this frame
                repeat_counter <= 2'd3;  // we will be transmitting 3 marker bytes
                write_en <= 0;

                last_pixel <= 0;
                pixel_idx <= 0;
                lohalf <= 0;
            end

            else if (repeat_counter != 2'd0)
            // if transmitting frame start mark
            begin
                /* need to transmit special marker (8'b10101010) byte this cycle */
                repeat_counter <= repeat_counter - 2'd1;    // decrease marker counter
                output_data <= 8'b10101010;
                write_en <= 1;
            end

            else if (cam_hsync == 1)
            // if valid camera data is coming
            begin
                
                if (compress_mode == 3'b111)
                    // TODO: should use smartfreeze to disable this part of circuit
                    begin
                        if (lohalf == 1)
                        // lower nibble of a pixel
                        begin
                            pixel_idx <= pixel_idx + 1;
                            lohalf <= 0;
                            if (pixel_idx == 0)
                            // we transmit a reference pixel every 33 pixels
                            begin
                                write_en <= 1;
                                output_data[7:0] <= {hi_nibble[3:0], cam_data[3:0]};
                                last_pixel <= {hi_nibble[3:0], cam_data[3:0]};
                            end
                            else
                            // for pixels between ref pixels, just transmit delta
                            begin
                                if (pixel_idx == 32)
                                    pixel_idx <= 0;
                                if (buffer_state == 7)
                                begin
                                    buffer_state <= 0;
                                    write_en <= 1;
                                end
                                else
                                begin
                                    buffer_state <= buffer_state + 1;
                                    write_en <= 0;
                                end
                                if ({hi_nibble[3:0], cam_data[3:0]} > last_pixel)
                                begin
                                    output_data[7:1] <= output_data[6:0];
                                    output_data[0] <= 1;
                                    if (last_pixel < 240)   // saturate logic
                                        last_pixel <= last_pixel + 16;
                                    else
                                        last_pixel <= 255;
                                end
                                else
                                begin
                                    output_data[7:1] <= output_data[6:0];
                                    output_data[0] <= 0;
                                    if (last_pixel > 15)
                                        last_pixel <= last_pixel - 16;
                                    else
                                        last_pixel <= 0;
                                end
                            end
                        end
                        else
                        // higher nibble of a pixel
                        begin
                            write_en <= 0;
                            hi_nibble[3:0] <= cam_data[3:0];  // latch higher nibble
                            lohalf <= 1;
                        end
                    end

                else if (compress_mode == 3'b100)   // downsampling
                    begin
                        buffer_state <= buffer_state + 1;
                        write_en <= 0;
                        if (buffer_state == 0)
                            output_data[7:4] <= cam_data[3:0];
                        else if (buffer_state == 2)
                            output_data[3:0] <= cam_data[3:0];
                        else if (buffer_state == 3)
                        begin
                            write_en <= 1;
                            buffer_state <= 0;
                        end 
                    end

                else if (compress_mode == 3'b000)
                    begin
                        if (buffer_state == 0)  // higher nibble
                        begin
                            write_en <= 0;
                            output_data[7:4] <= cam_data[3:0];
                            buffer_state <= 1;
                        end
                        else                    // lower nibble
                        begin
                            write_en <= 1;
                            output_data[3:0] <= cam_data[3:0];
                            buffer_state <= 0;
                        end
                    end

            end

            else
            // if in between of two pixel rows
            begin
                write_en <= 0;  // disable fifo read, since we are in between valid lines
            end

        end
        else
        begin
        /* vsync low, not in the middle of a frame
           COND = 1*/
            frame_flag <= 0;    // record that this cycle vsync is low
            write_en <= 0;
        end
    end
end

endmodule

