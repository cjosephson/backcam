/*
 * Measures the length of each packet and decodes the downlink
 * downlink format: 15 [preamble 11011101 x 8] 7 [resolution x 1] 6 [compression x 3] 3 [repetition x 3] 0
 */
 
`define BIT_1_LENGTH 2416    /* length of a '1' bit, unit is us.  */
`define BIT_0_LENGTH 2016    /* length of a '0' bit, unit is us.  */
`define ALLOWED_DIFF 80      /* allowed difference in packet length, unit is us */
                             /* i.e. packet sized BIT_1_LENGTH +- ALLOWED_DIFF will be considered as 1 */

module downlink_decoder ( clock, reset, trigger, detected, downlink_bit );
input clock;    // input clock (1MHz)
input reset;    // reset signal
input trigger;  // trigger signal from envelope detector

output reg downlink_bit;
output reg detected;
 
reg trigger_state;          // trigger state at previous cycle
reg[11:0] packet_length;    // measures the length of the current wifi packet

always @(posedge clock or negedge reset)
// reception logic
begin
    if (!reset)
    /* if reset pressed */
    begin
        /* reset */
        packet_length <= 0;
        trigger_state <= 0;
        downlink_bit <= 0;
        detected <= 0;
    end

    else
    begin
        if (trigger == 1) // wifi packet in air
        begin
            packet_length <= packet_length + 1;
            trigger_state <= 1;
            detected <= 0;
            downlink_bit <= 0;
        end

        else
        begin
            if (trigger_state == 0)    // no wifi packet
            begin
                packet_length <= 0;
                trigger_state <= 0;
                detected <= 0;
                downlink_bit <= 0;
            end

            else                       // wifi packet just ended
            begin
                if ((packet_length > (`BIT_1_LENGTH - `ALLOWED_DIFF)) &&
                    (packet_length < (`BIT_1_LENGTH + `ALLOWED_DIFF)))
                // detected an '1' bit
                begin
                    detected <= 1;
                    downlink_bit <= 1;
                    packet_length <= 0;
                    trigger_state <= 0;
                end
                else if ((packet_length > (`BIT_0_LENGTH - `ALLOWED_DIFF)) &&
                         (packet_length < (`BIT_0_LENGTH + `ALLOWED_DIFF)))
                // detected a '0' bit
                begin
                    detected <= 1;
                    downlink_bit <= 0;
                    packet_length <= 0;
                    trigger_state <= 0;
                end
                else
                // not a downlink packet
                begin
                    detected <= 0;
                    downlink_bit <= 0;
                    packet_length <= 0;
                    trigger_state <= 0;
                end
            end
        end
    end
end

endmodule