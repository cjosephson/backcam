create_clock -period 160.000000 -waveform {0.000000 80.000000} p:pclk
create_clock -period 20.000000 -waveform {0.000000 10.000000} n:pll_core_0.GLA
create_clock -period 1000.000000 -waveform {0.000000 500.000000} n:clock_control_0.clock_out

