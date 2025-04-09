set_multi_cpu_usage -local_cpu 8

set_db read_db_stop_at_design_in_memory false

set_db eco_honor_dont_touch true
set_db eco_honor_fixed_status true

read_db ../../design_Tjfree.dat
set TOP_DESIGN [get_db current_design .name]

mkdir -p reports

if {[catch {eco_design ../../design_Tjfree.dat ${TOP_DESIGN} design_Tjin.vh -no_add_filler}]} {
    ## UNPLACED insts
    check_design -type route > reports/check_place.rpt
    check_place >> reports/check_place.rpt
    puts "Trojan cannot be placed! Abort."
    exit
}

# opt_design -post_route

# write_db aes_128_Tjin.dat -lib
set_db write_def_lef_out_version 5.8
write_def -routing design.def

## Export basic reports
report_timing_summary > reports/timing.rpt
report_power > reports/power.rpt
report_density_in_area -area [get_db current_design .bbox] > reports/density.rpt
report_wires reports/wire_length.rpt -summary
check_drc -out_file reports/drc.rpt

# Timing paths
report_timing -output_format gtd -max_paths 1000000 -path_exceptions all > reports/top.mtarpt
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
