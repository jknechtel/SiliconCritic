set_multi_cpu_usage -local_cpu 8

# process setting
set_db design_process_node 45

# init activitiy factors
set_default_switching_activity -sequential_activity 0.2

# clock propagation
set_interactive_constraint_modes [all_constraint_modes -active]
reset_propagated_clock [all_clocks]
update_io_latency -verbose
set_propagated_clock [all_clocks]

# timing setting
set_db timing_analysis_type ocv

## Delete filler cells
# delete_filler -prefix FILL

## Fix all insts and nets
foreach cell [get_db insts] {
    set_db $cell .dont_touch true
    set_db $cell .place_status fixed
}
# foreach net [get_db nets -if {!.is_power && !.is_ground}] {
#     set_dont_touch $net true
# }

## Export design and netlist
write_db design_Tjfree.dat -lib
write_netlist design_Tjfree.vh

## Exports reports
write_tcf reports/net_toggle.tcf
report_timing_summary > reports/timing.rpt
report_power > reports/power.rpt
report_density_in_area -area [get_db current_design .bbox] > reports/density.rpt
check_drc -out_file reports/drc.rpt

# Timing paths
report_timing -output_format gtd -max_paths 100000 -path_exceptions all > reports/top.mtarpt
read_timing_debug_report -name default_report reports/top.mtarpt
write_path_list_summary -csv -report reports/path_delay.csv

# Regional powers
set seg_power_file [open "reports/regional_power.csv" w]
puts $seg_power_file "Region,Total Power,Leakage Power"

set K 20
set core_llx [get_db current_design .core_bbox.ll.x]
set core_lly [get_db current_design .core_bbox.ll.y]
set core_urx [get_db current_design .core_bbox.ur.x]
set core_ury [get_db current_design .core_bbox.ur.y]

set step_x [expr {($core_urx - $core_llx) / $K}]
set step_y [expr {($core_ury - $core_lly) / $K}]

for {set i 0} {$i < $K} {incr i} {
    for {set j 0} {$j < $K} {incr j} {
        puts "Process region ($i, $j)"
        set tile_bbox [list [expr {$core_llx + $i * $step_x}] [expr {$core_lly + $j * $step_y}] \
                            [expr {$core_llx + ($i + 1) * $step_x}] [expr {$core_lly + ($j + 1) * $step_y}]]
        set cells_in_tile [get_db [get_obj_in_area -area $tile_bbox -obj_type inst] .name]
        
        report_power -insts $cells_in_tile > power.temp
        set total_power [exec grep "^Total                                                   " power.temp | awk {{print $5}}]
        set leak_power [exec grep "^Total                                                   " power.temp | awk {{print $4}}]
        exec rm power.temp

        puts $seg_power_file "([expr $i+1]-[expr $j+1]), $total_power, $leak_power"

    }
}

close $seg_power_file

exit
