## This file is a general .xdc for the Basys3 Rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property PACKAGE_PIN W5 [get_ports {CLK100MHZ}]							
set_property IOSTANDARD LVCMOS33 [get_ports {CLK100MHZ}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK100MHZ}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets btnC_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets btnR_IBUF]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets btnU_IBUF]

# Switches
set_property PACKAGE_PIN V17 [get_ports {sw}]					
set_property IOSTANDARD LVCMOS33 [get_ports {sw}]
# Uncomment and assign pins for additional switches
#set_property PACKAGE_PIN V16 [get_ports {sw[1]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
#set_property PACKAGE_PIN W16 [get_ports {sw[2]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
#set_property PACKAGE_PIN W17 [get_ports {sw[3]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
#set_property PACKAGE_PIN W15 [get_ports {sw[4]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
#set_property PACKAGE_PIN V15 [get_ports {sw[5]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
#set_property PACKAGE_PIN W14 [get_ports {sw[6]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
#set_property PACKAGE_PIN W13 [get_ports {sw[7]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
#set_property PACKAGE_PIN V2 [get_ports {sw[8]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
#set_property PACKAGE_PIN T3 [get_ports {sw[9]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
#set_property PACKAGE_PIN T2 [get_ports {sw[10]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
#set_property PACKAGE_PIN R3 [get_ports {sw[11]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
#set_property PACKAGE_PIN W2 [get_ports {sw[12]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
#set_property PACKAGE_PIN U1 [get_ports {sw[13]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
#set_property PACKAGE_PIN T1 [get_ports {sw[14]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
#set_property PACKAGE_PIN R2 [get_ports {sw[15]}]					
# set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]

# LEDs
set_property PACKAGE_PIN P17 [get_ports {clk}]          # Clock pin assignment
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]       # I/O standard for clk

set_property PACKAGE_PIN L17 [get_ports {led[0]}]      # LED 0 pin assignment
set_property PACKAGE_PIN L18 [get_ports {led[1]}]      # LED 1 pin assignment
set_property PACKAGE_PIN M17 [get_ports {led[2]}]      # LED 2 pin assignment
set_property PACKAGE_PIN M18 [get_ports {led[3]}]      # LED 3 pin assignment
set_property PACKAGE_PIN N17 [get_ports {led[4]}]      # LED 4 pin assignment
set_property PACKAGE_PIN N18 [get_ports {led[5]}]      # LED 5 pin assignment
set_property PACKAGE_PIN P18 [get_ports {led[6]}]      # LED 6 pin assignment
set_property PACKAGE_PIN P19 [get_ports {led[7]}]      # LED 7 pin assignment
set_property IOSTANDARD LVCMOS33 [get_ports {led[7:0]}] # I/O standard for LEDs

# 7-segment display
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]					
set_property IOSTANDARD LVCMOS33 [get_ports {seg[6]}]
#set_property PACKAGE_PIN V7 [get_ports dp]							
#set_property IOSTANDARD LVCMOS33 [get_ports dp]

# Enable signals
set_property PACKAGE_PIN X1 [get_ports {en[0]}]        # Enable pin assignment (example)
set_property PACKAGE_PIN X2 [get_ports {en[1]}]
set_property PACKAGE_PIN X3 [get_ports {en[2]}]
set_property PACKAGE_PIN X4 [get_ports {en[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {en[3:0]}] # I/O standard for en[3:0]

## Buttons
set_property PACKAGE_PIN U18 [get_ports {btnC}]						
set_property IOSTANDARD LVCMOS33 [get_ports {btnC}]
set_property PACKAGE_PIN T18 [get_ports {btnU}]						
set_property IOSTANDARD LVCMOS33 [get_ports {btnU}]
#set_property PACKAGE_PIN W19 [get_ports {btnL}]						
#set_property IOSTANDARD LVCMOS33 [get_ports {btnL}]
set_property PACKAGE_PIN T17 [get_ports {btnR}]						
set_property IOSTANDARD LVCMOS33 [get_ports {btnR}]
#set_property PACKAGE_PIN U17 [get_ports {btnD}]						
#set_property IOSTANDARD LVCMOS33 [get_ports {btnD}]
