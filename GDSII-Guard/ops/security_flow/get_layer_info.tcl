proc get_layer_info {} {

    set layers [get_db layers -if {.type == *routing}]

    set layer_info [list]
    foreach layer $layers {
        set layer_name [get_db $layer .name]
        set layer_width [get_db $layer .width]
        lappend layer_info [list $layer_name $layer_width]
    }

    return $layer_info
}