/*
 * Provides switch signal and low frequency clock to other components in TX logic
 */
 
`define TX_DELAY 440 // delay between envelope detector to first control signal, unit is NOT microsecond

module clock_control( clock, reset, clock_out, trigger, switch );
input clock;    // input clock (50MHz)
input reset;    // reset signal
input trigger;  // trigger signal from envelope detector

output reg clock_out;   // 1MHz clock to TX components, will sync with trigger rising edge
output reg switch;      // control signal to be fed into TX components

reg[5:0] counter;       // clock divider
reg[11:0] delay_counter; // count delay between trigger rising and switch rising

always @(posedge clock or negedge reset)
begin
    if (!reset)
    /* if reset pressed */
    begin
        counter <= 0;
        clock_out <= 0;
        switch <= 0;
        delay_counter <= 0;
    end
    else if (trigger)
    begin
    // trigger high, wifi packet in the air
        if (counter == 0)
        // beginning cycle 0, time to flip the clock output
        // TODO: potential problem here. clock rises up to one cycle later than trigger
        // because clock only toggles at rising edge of input clock
        begin
            delay_counter <= delay_counter + 1; // increase delay counter
            clock_out <= ~clock_out;    // flip the clock output
            counter <= counter + 1;     // increase clock cycle no.
            if (delay_counter > (`TX_DELAY * 2 - 1))    
                // we do DELAYx2-1 because this counter is increased every rising AND falling edge of clock
                switch <= 1;            // if we've delayed `TX_DELAY bytes 
            else
                switch <= 0;
        end
        if (counter == 24)
        // now beginning cycle 24, next cycle will be 0. So we are toggling the clock every 25 cycles
            counter <= 0;
        else
        // just increase clock divider counter
            counter <= counter + 1;
    end
    else
    // trigger low, no wifi packet
    begin
        counter <= 0;
        clock_out <= 0; // it means that we get at most a falling edge after trigger falls
        switch <= 0;
        delay_counter <= 0;
    end
end

endmodule
