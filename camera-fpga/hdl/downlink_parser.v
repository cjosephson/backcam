/*
 * parse decoded downlink data
 */
 

module downlink_parser ( clock, reset, write_en, downlink_bit, compression, repetition, resolution );
input clock;      // input clock (1MHz)
input reset;      // reset signal
input write_en;    // write enable signal from downlink decoder
input downlink_bit; // data demodulated from downlink 

output reg resolution;          // decoded resolution bit, 0=low, 1=high
                                // for now, it goes to F4 and F5 pin and triggers interrupt to reconfigure camera
output reg[2:0] compression;    // decoded compression control bit
                                // 000=no compression, 111=strongest compression, no use for now
output reg[2:0] repetition;     // decoded repetition control bit
                                // no use for now
reg[14:0] downlink_buffer;  // shift register, holds downlink decoded so far; LSB=most recently decoded

always @(negedge clock or negedge reset)
begin
    if (!reset)
    /* if reset pressed */
    begin
        /* reset */
        downlink_buffer <= 0;
    end
    else if (write_en == 1)
    begin
        downlink_buffer <= {downlink_buffer[13:0], downlink_bit};
    end
    else
    begin
        downlink_buffer <= downlink_buffer;
    end
end

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        resolution <= 0;
        compression <= 0;
        repetition <= 0;
    end
    else
    begin
        if (downlink_buffer[14:7] == 8'b11011101)
        begin
            resolution <= downlink_buffer[6];
            compression <= 3'b000;  // unused for now
            repetition <= 3'b000;   // unused for now
        end
        else
        begin
            resolution <= resolution;
            compression <= compression;
            repetition <= repetition;
        end
    end
end

endmodule