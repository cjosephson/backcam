/* generate signal to be sent to RF switch */

module switch_encoder( clock, trigger, data, signal_to_switch );
input clock, trigger, data;
output signal_to_switch;

/* assign signal_to_switch = (trigger & ((data & clock) | ((~data) & (~clock)))) | ((~trigger) & clock); */
assign signal_to_switch = (trigger & data) ^ trigger ^ clock;

endmodule

