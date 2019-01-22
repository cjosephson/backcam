module dbpsk_modulator( clock, reset, input_data, trigger, output_dbpsk);
input clock, reset;
input trigger;
input input_data;
output reg output_dbpsk;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        output_dbpsk <= 0;
    end
    else if (trigger)
    begin
        if (input_data==0)
            output_dbpsk <= output_dbpsk;
        else
            output_dbpsk <= ~output_dbpsk;
    end
    else
    begin
        output_dbpsk <= 0;
    end
end

endmodule

