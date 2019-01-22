module fakedata_gen( clock, reset, output_data, pclk, hsync, vsync );
input clock, reset;
output reg pclk;
output reg hsync;
output reg vsync;
output reg[7:0] output_data;

reg[15:0] counter;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        hsync <= 0;
        vsync <= 0;
        output_data <= 8'd0;
        pclk <= 0;
        counter <= 0;
    end
    else if (trigger)
    begin
        if (counter==16'd159)
        begin
            write_en <= 1;
            counter <= counter+1;
            //output_data <= 8'b11110000;
            output_data <= output_data + 8'd1;
        end
        else
        begin
            counter <= counter + 1;
            if (counter==16'd299)
                counter <= 0;
                output_clk <= ~output_clk;
        end
    end
    else
    begin
        write_en <= 1;
        output_data <= 0;       
        counter <= 0;
    end
end

endmodule

