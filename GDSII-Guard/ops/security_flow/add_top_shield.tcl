proc add_shield_drc {top_layer_num} {
    # Add metal shield
    set die_bbox [get_db current_design .bbox]
    create_net -name top_shield
    create_shape -net top_shield -layer $top_layer_num -rect $die_bbox

    global net_assets
    foreach net $net_assets {
        set_route_attributes -nets $net \
            -top_preferred_routing_layer [expr {$top_layer_num - 1}] \
            -preferred_routing_layer_effort hard
    }
    route_design

}

proc add_shield_strict {top_layer_num} {
    # Add metal shield
    set die_bbox [get_db current_design .bbox]
    create_net -name top_shield
    create_shape -net top_shield -layer $top_layer_num -rect $die_bbox

    global net_all
    foreach net $net_all {
        set_route_attributes -nets $net \
            -top_preferred_routing_layer [expr {$top_layer_num - 1}] \
            -preferred_routing_layer_effort hard
    }
    route_design

}

proc check_net_layer {top_layer_num} {

    global net_assets
    foreach net $net_assets {
        if {[lsearch [get_db net:$net .wires.layer] "layer:metal$top_layer_num"] > 0} {
            puts "$net"}
        }
}