define_clock {p:pclk} -freq 1 -clockgroup camera
define_clock {n:pll_core_0.GLA} -freq 50 -clockgroup main
define_clock {n:downlink_clock_divider_0.clock_out} -freq 1 -clockgroup downlink
define_clock {n:clock_control_0.clock_out} -freq 1 -clockgroup main