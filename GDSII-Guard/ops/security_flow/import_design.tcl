######
# Settings
######
set_multi_cpu_usage -local_cpu 8
set_db design_process_node 45

set_db source_continue_on_error true

set mmmc_path mmmc.tcl
set lef_path NangateOpenCellLibrary.lef
set def_path design_original.def
set netlist_path design_original.v

set cell_assets_path cells.assets
set net_assets_path nets.assets

set cell_assets_file [open $cell_assets_path r]
set net_assets_file [open $net_assets_path r]


set cell_assets [list]
set net_assets [list]
proc remove_backslash str {
    regsub -all {\\} $str {} str_new
    return $str_new
}

while { [gets $cell_assets_file line] > 0 } {
    lappend cell_assets [remove_backslash $line]
}
while { [gets $net_assets_file line] > 0 } {
    lappend net_assets [remove_backslash $line]
}
close $cell_assets_file
close $net_assets_file


######
# Init Design
######
read_mmmc $mmmc_path
read_physical -lefs $lef_path
read_netlist $netlist_path
read_def $def_path

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

set net_all [get_db [get_db nets -if {!.is_power && !.is_ground}] .name]
set cell_all [get_db [get_db insts] .name]
set net_others [list]
set cell_others [list]

foreach cell $cell_all {
    if {[lsearch -exact $cell_assets $cell] < 0} {
        lappend cell_others $cell
    }
}
foreach net $net_all {
    if {[lsearch -exact $net_assets $net] < 0} {
        lappend net_others $net
    }
}

## Delete filler cells and routes
delete_filler -prefix FILL
delete_routes -net net:* -type Regular

######
# Add global constraints
######

# Preserve critical cell/net assets
foreach cell $cell_assets {
    set_db inst:$cell .dont_touch size_ok
}
foreach net $net_assets {
    set_dont_touch $net true
}

