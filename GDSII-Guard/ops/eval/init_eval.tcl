####
# settings
####
set_multi_cpu_usage -local_cpu 8
set_db design_process_node 45

## Preset in Python
# set result_dir xxx

set mmmc_path mmmc.tcl
set lef_path NangateOpenCellLibrary.lef
set def_path ${result_dir}/design.def
set netlist_path ${result_dir}/design.v

####
# init
####
read_mmmc $mmmc_path
read_physical -lefs $lef_path
read_netlist $netlist_path
read_def $def_path -preserve_shape

init_design

####
# clock propagation
####
set_interactive_constraint_modes [all_constraint_modes -active]
reset_propagated_clock [all_clocks]
update_io_latency -adjust_source_latency -verbose
set_propagated_clock [all_clocks]

####
# timing
####
set_db timing_analysis_type ocv
set_db timing_analysis_cppr both
time_design -post_route

####
# basic eval
####
report_power > ${result_dir}/reports/power.rpt
report_timing_summary -checks setup > ${result_dir}/reports/timing.rpt
check_drc > ${result_dir}/reports/drc.rpt
set fl [open ${result_dir}/reports/area.rpt w]
puts $fl [get_db current_design .bbox.area]
close $fl

## NOTE no exit here, as this is supposed to be sourced along with other scripts
