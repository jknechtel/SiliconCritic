proc tile_dens_adjust {K n_iter} {
    ### Args
    # K - tile is K x K
    # n_iter - number of placement iterations    
    global cell_assets
    set sum_all_assets [llength $cell_assets]
    set core_llx [get_db current_design .core_bbox.ll.x]
    set core_lly [get_db current_design .core_bbox.ll.y]
    set core_urx [get_db current_design .core_bbox.ur.x]
    set core_ury [get_db current_design .core_bbox.ur.y]

    set step_x [expr {($core_urx - $core_llx) / $K}]
    set step_y [expr {($core_ury - $core_lly) / $K}]

    for {set i_iter 0} {$i_iter < $n_iter} {incr i_iter} {

        delete_obj [get_db place_blockages]
        set Pij_list [list]

        for {set i 0} {$i < $K} {incr i} {
            for {set j 0} {$j < $K} {incr j} {
                set tile_bbox [list [expr {$core_llx + $i * $step_x}] [expr {$core_lly + $j * $step_y}] \
                                    [expr {$core_llx + ($i + 1) * $step_x}] [expr {$core_lly + ($j + 1) * $step_y}]]
                set cells_in_tile [get_db [get_obj_in_area -area $tile_bbox -obj_type inst] .name]
                set sum_tile_assets 0
                foreach cell $cells_in_tile {
                    if {[lsearch -exact $cell_assets "$cell"] >= 0} {
                        incr sum_tile_assets
                    }
                }
                set Pij [expr {double($sum_tile_assets) / $sum_all_assets}]
                lappend Pij_list $Pij
            }
        }
        set Pij_norm_list [norm_list $Pij_list]

        for {set i 0} {$i < $K} {incr i} {
            for {set j 0} {$j < $K} {incr j} {
                set Pij_norm [lindex $Pij_norm_list [expr {$i * $K + $j}]]
                set Pij_dens [sigmoid $Pij_norm 2]
                set Pij_dens [round_to_dens $Pij_dens 15]

                if {$Pij_dens != 100} {
                    set tile_bbox [list [expr {$core_llx + $i * $step_x}] [expr {$core_lly + $j * $step_y}] \
                                        [expr {$core_llx + ($i + 1) * $step_x}] [expr {$core_lly + ($j + 1) * $step_y}]]
                    create_place_blockage -type partial -density $Pij_dens -rects $tile_bbox
                }
            }
        }

        set_db opt_honor_density_screen true
        place_opt_design

    }

}

########
# Helper functions
########
proc norm_list {lst} {
    package require math::statistics

    set lst_new [list]
    set mean [::math::statistics::mean $lst]
    set stdev [::math::statistics::stdev $lst]
    foreach num $lst {
        set num_normalized [expr {($num - $mean) / $stdev}]
        lappend lst_new $num_normalized
    }

    return $lst_new
}

proc sigmoid {num slope} {
    return [expr {1.0 / (1.0 + exp(- $slope * $num))}]
}

proc round_to_dens {_num bonus} {
    set num [expr {round(100.0 * $_num / 5.0) * 5 + $bonus}]
    if {$num < 5.0} { set num 5}
    if {$num > 100.0} {set num 100}
    return [expr int($num)]
}