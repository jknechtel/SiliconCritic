foreach inst [get_db insts] {
    if {[get_db $inst .place_status] == "unplaced"} {
        puts "$inst"
        delete_inst -inst [get_db $inst .name]
    } 
}
