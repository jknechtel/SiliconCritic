proc gate_upsize {target_density} {
    # target_density: 0~1
    set rows [get_db rows]

    for {set rnd 0} {$rnd < 6} {incr rnd} {
        set row_i 1
        foreach row $rows {
            set row_bbox [get_db $row .rect]
            set llx [get_rect -llx $row_bbox]
            set lly [get_rect -lly $row_bbox]
            set urx [get_rect -urx $row_bbox]
            set ury [get_rect -ury $row_bbox]
            set fit_bbox [list $llx [expr $lly + 0.02] $urx [expr $ury - 0.02]]

            set cells_to_upsize [get_db [get_obj_in_area -area $fit_bbox -obj_type {inst}] .name]
            set cell_sum [llength $cells_to_upsize]
            set cell_i 1

            if {[expr $rnd % 2] == 1} { set cells_to_upsize [lreverse $cells_to_upsize]}

            foreach cell $cells_to_upsize {
                set row_dens [eval "report_density_in_area -area $row_bbox"]
                puts "\n******** Current row density: $row_dens ********\n"
                if {$row_dens < $target_density} {
                    puts "\n******** Upsizing $cell_i / $cell_sum cell in row $row_i ... ********\n"
                    catch { eco_update_cell -insts $cell -up_size }
                }
                incr cell_i
            }
            incr row_i
        }

    }
    

}