proc get_metal_layers {} {

    set layers [get_db layers -if {.type == *routing}]

    set layer_indexs [get_db $layers .route_index]

    set res [lindex $layer_indexs 0]
    foreach element $layer_indexs {
        if {$element > $res} {set res $element}
    }
    return $res
}