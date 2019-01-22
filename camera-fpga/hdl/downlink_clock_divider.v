/*
 * generates 1MHz clock for downlink
 */
 
module downlink_clock_divider ( clock, reset, clock_out );
input clock;    // input clock (50MHz)
input reset;    // reset signal

output reg clock_out;
 
reg[5:0] divider_counter;    

always @(posedge clock or negedge reset)
// reception logic
begin
    if (!reset)
    /* if reset pressed */
    begin
        clock_out <= 0;
        divider_counter <= 0;
    end

    else
    begin
        if (divider_counter == 0)
        begin
            clock_out <= ~clock_out;
            divider_counter <= divider_counter + 1;
        end
        else if (divider_counter == 24)
        begin
            clock_out <= clock_out;
            divider_counter <= 0;
        end
        else
        begin
            clock_out <= clock_out;
            divider_counter <= divider_counter + 1;
        end
    end
end

endmodule