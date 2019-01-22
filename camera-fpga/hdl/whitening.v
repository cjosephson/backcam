module whitening( clock, reset, input_data, trigger, output_whitening );
input clock, reset;
input trigger;
input input_data;
output reg output_whitening;

reg[6:0] state;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        state <= 7'b0000000;
    end
    else if (trigger)
    begin
        state[6:1] <= state[5:0];
        //state[0]   <= input_data;
        state[0]   <= input_data ^ state[3] ^ state[6];
        output_whitening <= input_data ^ state[3] ^ state[6];
    end
    else
    begin
        state <= 7'b0000000;
    end
end

endmodule

