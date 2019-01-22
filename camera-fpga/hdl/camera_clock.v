/*
 * clock divider for camera
 */
 
module camera_clock( clock, reset, clock_out );
input clock;    // input clock (100MHz, will be 50MHz in new low-power design
input reset;    // reset signal

output reg clock_out;   // 1MHz clock to TX components, will sync with trigger rising edge

reg[5:0] counter;   // clock divider

always @(posedge clock or negedge reset)
begin
    if (!reset)
    /* if reset pressed */
    begin
        counter <= 0;
        clock_out <= 0;
    end
    else 
    begin
        if (counter == 0)
        begin
            clock_out <= ~clock_out;    // flip the clock output
            counter <= counter + 1;     // increase clock cycle no.
        end
        if (counter == 5)               // flip the clock every 6 cycles. resulting in 4.16MHz
            counter <= 0;
        else
            counter <= counter + 1;
    end
end

endmodule
