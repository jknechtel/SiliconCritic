set_attribute max_cpus_per_server 8 /
set_attribute super_thread_servers "localhost" /

# All HDL files, separated by spaces
# set hdl_files {Trojan.v}

# set lib_path {../lib/NangateOpenCellLibrary.lib}

# Set clock pin name in design. If clk just leave untouched,
# otherwise change clk
set clkpin clk

# Target period in ps for optimization
set delay 1000

set port_delay 0.0

#**************************************************/

set_attribute information_level 6 /

set_attribute library ${lib_path}
read_hdl ${hdl_files}

# elaborate $DESIGN
elaborate

# Apply Constraints
set clock [define_clock -period ${delay} -name ${clkpin} [clock_ports]]
external_delay -input   ${port_delay} -clock clk [find / -port ports_in/*]
external_delay -output  ${port_delay} -clock clk [find / -port ports_out/*]
# # Sets transition to default values for Synopsys SDC format, fall/rise
# # 200ps
# dc::set_clock_transition .2 clk

check_design -unresolved

report timing -lint

set syn_map_effort high
#*Synthesis
synthesize -to_mapped

report timing > reports/timing.rpt
report gates  > reports/cell.rpt
report power  > reports/power.rpt

write_hdl -mapped > Trojan.vh
write_sdc > Trojan.sdc

quit