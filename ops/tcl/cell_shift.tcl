#############################
# Adjust cells to minimize ERs after place
#############################

set_multi_cpu_usage -local_cpu 8

puts "Remove all existing routes"
delete_routes -net net:* -type Regular

######## Global variables ########
# Threshold site number of exploitable regions
# >= 20 are considered

set thres 20

# List of rows
set rows [get_db rows]
# First row
set row_0 [lindex $rows 0]
# Width of a site
set step_x [get_db $row_0 .step_x]
# Number of sites in a row
set row_sites_sum [get_db $row_0 .num_x]
# X-coordinate of left boundary 
set left_x [get_rect -llx [get_db $row_0 .rect]]

### freeRs Structure: 2-D list
# [[freeR_1 freeR_2 ... freeR_x1]    # Row0
#  [freeR_(x1+1) freeR_(x1+2) ...]  # Row1
#   ......
#                               ]
set free_regions [list]

# Global variables for sites_sum
set site_cnt 0
set freeR_visited [list]

### Unit: site
# | | | |x|x| | |x|x|x|x|x| | |...| |
# 0 1 2 3 4 5 6 7 8 9 ....          row_sites_sum



######## Helper functions ########

# Create and return a new freeR
proc new_freeR {xy_index l r adj_freeRs l_inst r_inst} {
    return [list $xy_index $l $r $adj_freeRs $l_inst $r_inst]
}
proc get_freeR_xy_index {freeR} { return [lindex $freeR 0] }
proc get_freeR_l {freeR} { return [lindex $freeR 1] }
proc get_freeR_r {freeR} { return [lindex $freeR 2] }
proc get_freeR_len {freeR} { return [len [get_freeR_l $freeR] [get_freeR_r $freeR]] }
proc get_freeR_adj_freeRs {freeR} { return [lindex $freeR 3] }
proc get_freeR_l_inst {freeR} { return [lindex $freeR 4]}
proc get_freeR_r_inst {freeR} { return [lindex $freeR 5]}

proc len {L R} {
    # Length of [L, R] in sites
    return [expr {$R - $L}]
}

proc dec {num} {
    return [expr {$num - 1}]
}

# Judge if two ranges intersect
proc intersect {l1 r1 l2 r2} {
    if {$r1 <= $l2 || $r2 <= $l1} {return false}
    return true
}

# Create and return a new inst
proc new_inst {name l r} {
    return [list $name $l $r]
}
proc get_inst_name {inst} {return [lindex $inst 0]}
proc get_inst_l {inst} {return [lindex $inst 1]}
proc get_inst_r {inst} {return [lindex $inst 2]}

### Get a sorted list of insts in a row
# Unit is *site*!
proc get_insts_cur_row {row} {
    global left_x
    global step_x
    set row_bbox [get_db $row .rect]
    set llx [get_rect -llx $row_bbox]
    set lly [get_rect -lly $row_bbox]
    set urx [get_rect -urx $row_bbox]
    set ury [get_rect -ury $row_bbox]
    set fit_bbox [list $llx [expr $lly + 0.02] $urx [expr $ury - 0.02]]

    set insts_name [get_obj_in_area -obj_type inst -area $fit_bbox]
    set insts_bbox [get_db $insts_name .bbox]
    set insts [list]
    foreach inst_name $insts_name inst_bbox $insts_bbox {
        set l [expr {round(([lindex $inst_bbox 0] - $left_x) / $step_x)}]
        set r [expr {round(([lindex $inst_bbox 2] - $left_x) / $step_x)}]
        lappend insts [new_inst $inst_name $l $r]
    }
    set insts [lsort -integer -index 1 $insts]
    return $insts
}

# Shift an inst
proc shift_inst {inst_name direction dist_of_sites} {
    global step_x
    gui_deselect -all
    select_obj $inst_name
    set dist_of_um [expr $dist_of_sites * $step_x]
    # move_obj -selected -direction $direction -distance $dist_of_um
    # This command works with both innovus18/19
    shift_selected -direction $direction -distance $dist_of_um
}

# Update and return an inst after it's shifted
proc update_inst {inst direction dist_of_sites} {
    set inst_name [get_inst_name $inst]
    if {$direction == "left"} {
        set delta [expr {-$dist_of_sites}]
    } else {
        set delta $dist_of_sites
    }
    set new_l [expr {[get_inst_l $inst] + $delta}]
    set new_r [expr {[get_inst_r $inst] + $delta}]
    return [new_inst $inst_name $new_l $new_r]
}

# Get the freeR list of a row
proc get_row_freeRs {row_i} {
    global rows
    global row_sites_sum

    set row [lindex $rows $row_i]
    set insts_cur_row [get_insts_cur_row $row]
    set freeRs_cur_row [list]
    set prev_inst_r 0
    set freeR_i 0
    set prev_inst_name "none"
    foreach inst $insts_cur_row {
        set inst_l [get_inst_l $inst]
        set inst_name [get_inst_name $inst]

        if {[len $prev_inst_r $inst_l] > 0} {
            set adj_freeRs [get_adj_freeRs $row_i $prev_inst_r $inst_l]
            set freeR [new_freeR [list $row_i $freeR_i] $prev_inst_r $inst_l $adj_freeRs $prev_inst_name $inst_name]
            lappend freeRs_cur_row $freeR
            incr freeR_i
        }
        set prev_inst_r [get_inst_r $inst]
        set prev_inst_name $inst_name
    }
    if {$prev_inst_r < $row_sites_sum} {
        # Last freeR on the right
        set adj_freeRs [get_adj_freeRs $row_i $prev_inst_r $row_sites_sum]
        set freeR [new_freeR [list $row_i $freeR_i] $prev_inst_r $row_sites_sum $adj_freeRs $prev_inst_name "none"]
        lappend freeRs_cur_row $freeR
    }
    return $freeRs_cur_row
}

# Get a list of adjacent free regions of a freeR
proc get_adj_freeRs {row_i l r} {

    if {$row_i == 0} {return [list]}

    global free_regions
    set adj_freeRs [list]
    set prev_row_i [expr {$row_i - 1}]
    set freeRs_prev_row [lindex $free_regions $prev_row_i]
    for {set i 0} {$i < [llength $freeRs_prev_row]} {incr i} {
        set freeR [lindex $freeRs_prev_row $i]
        set freeR_l [get_freeR_l $freeR]
        set freeR_r [get_freeR_r $freeR]
        if {[intersect $l $r $freeR_l $freeR_r]} {
            lappend adj_freeRs [list $prev_row_i $i]
        }
        if {$r <= $freeR_l} { break }
    }
    return $adj_freeRs
}

# Update the adj_freeR of freeRs in the previous row
proc get_updated_prev_row_freeR {freeRs_prev_row freeRs_cur_row cur_row_i} {
    for {set i 0} {$i < [llength $freeRs_cur_row]} {incr i} {
        set freeR [lindex $freeRs_cur_row $i]
        set adjs [get_freeR_adj_freeRs $freeR]
        foreach adj $adjs {
            set adj_freeR_i [lindex $adj 1]
            set adj_freeR [lindex $freeRs_prev_row $adj_freeR_i]
            set adj_freeR [add_adj_freeR $adj_freeR [list $cur_row_i $i]]
            lset freeRs_prev_row $adj_freeR_i $adj_freeR
        }
    }
    return $freeRs_prev_row
}

# Return a freeR with a adj_freeR added
proc add_adj_freeR {freeR adj} {
    set adjs [get_freeR_adj_freeRs $freeR]
    lappend adjs $adj
    lset freeR 3 $adjs
    return $freeR
}

# Get a freeR with [row_i index]
proc get_freeR_by_index {xy_index} {
    global free_regions

    set row [lindex $free_regions [lindex $xy_index 0]]
    set freeR [lindex $row [lindex $xy_index 1]]
    return $freeR
}

# Sum sites of connected freeRs by DFS
proc sites_sum {freeR} {
    global free_regions
    global site_cnt
    global freeR_visited

    set n_sites [get_freeR_len $freeR]
    set site_cnt [expr {$site_cnt + $n_sites}]
    lappend freeR_visited [get_freeR_xy_index $freeR]

    set adj_freeRs [get_freeR_adj_freeRs $freeR]
    foreach adj_freeR $adj_freeRs {
        if {[lsearch $freeR_visited $adj_freeR] < 0} {
            sites_sum [get_freeR_by_index $adj_freeR]
        }
    }
}

# Reset global variables for sites_sum
proc reset_site_sum {} {
    global site_cnt
    global freeR_visited
    
    set site_cnt 0
    set freeR_visited [list]
}

# Build the whole freeR graph from scratch
proc build_freeR_graph {row_i orig_freeRs_prev_row} {
    global free_regions

    set prev_row_i [expr {$row_i - 1}]

    set freeRs_cur_row [get_row_freeRs $row_i]
    if {$row_i > 0} {
        set freeRs_prev_row [get_updated_prev_row_freeR $orig_freeRs_prev_row $freeRs_cur_row $row_i]
        lset free_regions $prev_row_i $freeRs_prev_row
    }
    lset free_regions $row_i $freeRs_cur_row
}



######## Main process ########

#### Process 1st row 
puts "\nProcessing row \[0\]: [get_db $row_0 .name]..."
set insts_cur_row [get_insts_cur_row $row_0]
set prev_inst_r 0
# Left shift
for {set i 0} {$i < [llength $insts_cur_row]} {incr i} {
    set inst [lindex $insts_cur_row $i]
    set inst_l [get_inst_l $inst]
    set shift_dist [expr {[len $prev_inst_r $inst_l] - $thres}]
    if {$shift_dist > 0} {
        set inst_name [get_inst_name $inst]
        shift_inst $inst_name "left" $shift_dist

        set updated_inst [update_inst $inst "left" $shift_dist]
        lset insts_cur_row $i $updated_inst
        set prev_inst_r [get_inst_r $updated_inst]
    } else {
        set prev_inst_r [get_inst_r $inst]
    }
}
# Right shift
set prev_inst_l $row_sites_sum
for {set i [expr {[llength $insts_cur_row]-1}]} {$i >= 0} {set i [dec $i]} {
    set inst [lindex $insts_cur_row $i]
    set inst_r [get_inst_r $inst]
    set shift_dist [expr {[len $inst_r $prev_inst_l] - $thres}]
    if {$shift_dist > 0} {
        set inst_name [get_inst_name $inst]
        shift_inst $inst_name "right" $shift_dist

        set updated_inst [update_inst $inst "right" $shift_dist]
        lset insts_cur_row $i $updated_inst
        set prev_inst_l [get_inst_l $updated_inst]
    } else {
        set prev_inst_l [get_inst_l $inst]
    }
}
# Update FreeRs
build_freeR_graph 0 [list]

######## Process remaining rows ########
for {set row_i 1} {$row_i < [llength $rows]} {incr row_i} {

    set row [lindex $rows $row_i]
    puts "Processing row \[$row_i\]: [get_db $row .name]..."
    set row_lly [get_rect -lly [get_db $row .rect]]
    set row_ury [get_rect -ury [get_db $row .rect]]

    ### Add current row to FreeR graph
    set orig_freeRs_prev_row [lindex $free_regions [expr {$row_i - 1}]]
    build_freeR_graph $row_i $orig_freeRs_prev_row

    ### Forward Scanning for ERs
    set freeR_i 0
    set num_freeR [llength [lindex $free_regions $row_i]]
    while {$freeR_i < $num_freeR} {

        set freeR [get_freeR_by_index [list $row_i $freeR_i]]
        reset_site_sum
        sites_sum $freeR
        puts "---- Forward: Processing Next free region (total $num_freeR) in [get_db $row .name], $site_cnt free sites in this region"

        ### ER detected
        set incr_freeR_i true
        while {$site_cnt > $thres} {
            set freeR_len [get_freeR_len $freeR]
            set inst [get_freeR_r_inst $freeR]
            if {$inst == "none"} { break }

            # Move 1 site at a time
            shift_inst $inst "left" 1

            # Re-build the freeR graph
            build_freeR_graph $row_i $orig_freeRs_prev_row
            if {$freeR_len == 1} {
                # Len of this freeR becomes 0 after movement
                set incr_freeR_i false
                break
            }
            set freeR [get_freeR_by_index [list $row_i $freeR_i]]
            reset_site_sum
            sites_sum $freeR
            
        }
        if {$incr_freeR_i} {
            incr freeR_i
        }

        set num_freeR [llength [lindex $free_regions $row_i]]
    }


    ### Backward Scanning for ERs
    set num_freeR [llength [lindex $free_regions $row_i]]
    set freeR_i [dec $num_freeR]
    set r_index 0
    while {$freeR_i >= 0} {
        set freeR [get_freeR_by_index [list $row_i $freeR_i]]
        reset_site_sum
        sites_sum $freeR
        puts "---- Backward: Processing Next free region (total $num_freeR) in [get_db $row .name], $site_cnt free sites in this region"

        ### ER detected
        set incr_r_index true
        while {$site_cnt > $thres} {
            set freeR_len [get_freeR_len $freeR]
            set inst [get_freeR_l_inst $freeR]
            if {$inst == "none"} { break }

            # Move 1 site at a time
            shift_inst $inst "right" 1

            # Re-build the freeR graph
            build_freeR_graph $row_i $orig_freeRs_prev_row
            if {$freeR_len == 1} {
                # Len of this freeR becomes 0 after movement
                set incr_r_index false 
                break 
            }
            set num_freeR [llength [lindex $free_regions $row_i]]
            set freeR_i [expr {$num_freeR - 1 - $r_index}]
            set freeR [get_freeR_by_index [list $row_i $freeR_i]]
            reset_site_sum
            sites_sum $freeR
            
        }
        if {$incr_r_index} {incr r_index}

        set num_freeR [llength [lindex $free_regions $row_i]]
        set freeR_i [expr {$num_freeR - 1 - $r_index}]
    }

}

puts "############ Finish cell shift, route again... ############"
route_design


