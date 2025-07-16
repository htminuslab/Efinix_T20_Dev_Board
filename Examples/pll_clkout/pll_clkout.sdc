# PLL Constraints
#################
create_clock -period 10.417 -name EFX_PLL_V2_inst~CLKOUT0 [get_ports {EFX_PLL_V2_inst~CLKOUT0}]

# GPIO Constraints
####################
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {RESETN}]
# set_input_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {RESETN}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -max <MAX CALCULATION> [get_ports {CLKOUT0}]
# set_output_delay -clock <CLOCK> [-reference_pin <clkout_pad>] -min <MIN CALCULATION> [get_ports {CLKOUT0}]
