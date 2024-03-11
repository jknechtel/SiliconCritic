proc row_upsize {row_i_list} {
    # List of rows
    set rows [get_db rows]
    foreach row_i $row_i_list {
        # Selected row
        set row [lindex $rows $row_i]

        set row_bbox [get_db $row .rect]
        set cells_to_upsize [get_db [get_obj_in_area -areas $row_bbox -obj_type {inst} -enclosed_only] .name]

        set cell_sum [llength $cells_to_upsize]
        set cell_i 1
        foreach cell $cells_to_upsize {
            puts "\n******** Upsizing $cell_i / $cell_sum cell in row $row_i ... ********\n"
            catch { eco_update_cell -insts $cell -up_size }
            incr cell_i
        }
    }
}

proc row_all_upsize {} {
    # List of rows
    set rows [get_db rows]
    set row_i 0
    foreach row $rows {
        set row_bbox [get_db $row .rect]
        set cells_to_upsize [get_db [get_obj_in_area -areas $row_bbox -obj_type {inst} -enclosed_only] .name]

        set cell_sum [llength $cells_to_upsize]
        set cell_i 1
        foreach cell $cells_to_upsize {
            puts "\n******** Upsizing $cell_i / $cell_sum cell in row $row_i ... ********\n"
            catch { eco_update_cell -insts $cell -up_size }
            incr cell_i
        }
        incr row_i
    }
}

proc row_downsize {row_i_list} {
    # List of rows
    set rows [get_db rows]
    foreach row_i $row_i_list {
        # Selected row
        set row [lindex $rows $row_i]

        set row_bbox [get_db $row .rect]
        set cells_to_upsize [get_db [get_obj_in_area -areas $row_bbox -obj_type {inst} -enclosed_only] .name]

        set cell_sum [llength $cells_to_upsize]
        set cell_i 1
        foreach cell $cells_to_upsize {
            puts "\n******** Upsizing $cell_i / $cell_sum cell in row $row_i ... ********\n"
            catch { eco_update_cell -insts $cell -down_size }
            incr cell_i
        }
    }
}