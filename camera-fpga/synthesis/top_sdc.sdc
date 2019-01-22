# Top Level Design Parameters

# Clocks

create_clock -name {pclk} -period 1000.000000 -waveform {0.000000 500.000000} pclk
create_clock -name {pll_core_0.GLA} -period 20.000000 -waveform {0.000000 10.000000} pll_core_0/Core:GLA
create_clock -name {downlink_clock_divider_0.clock_out} -period 1000.000000 -waveform {0.000000 500.000000} downlink_clock_divider_0/clock_out:Q
create_clock -name {clock_control_0.clock_out_RNICHN5} -period 1000.000000 -waveform {0.000000 500.000000} clock_control_0/clock_out_RNICHN5:Y

# False Paths Between Clocks


# False Path Constraints


# Maximum Delay Constraints


# Multicycle Constraints


# Virtual Clocks
# Output Load Constraints
# Driving Cell Constraints
# Wire Loads
# set_wire_load_mode top

# Other Constraints
