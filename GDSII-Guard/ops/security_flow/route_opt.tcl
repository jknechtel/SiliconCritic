delete_routes -net net:* -type Regular

## Preset in Python
# set width_scales [list 1 1.2 1 1 1 1]
set layers [get_layer_info]

set nets [get_db [get_db nets -if {!.is_power && !.is_ground}] .name]

set width_lst [list]

proc round_to_width {num} {
    return [expr round($num / 0.01) * 0.01]
}

foreach scale $width_scales layer $layers {
    if {$scale != 1} {
        lappend width_lst [lindex $layer 0]
        lappend width_lst [round_to_width [expr $scale * [lindex $layer 1]]]
    }
}

create_route_rule -name ndr -width $width_lst -generate_via

foreach net $nets {
    set_route_attributes -nets $net -route_rule ndr
}

route_design

## Fix DRC
check_drc
delete_routes_with_violations
foreach net $nets {
    set_route_attributes -nets $net -route_rule default
}
route_design

## Optimize timing
opt_design -post_route

connect_global_net VDD -type pg_pin -all -pin_base_name VDD
connect_global_net VSS -type pg_pin -all -pin_base_name VSS

## Optimize power
# opt_power -post_route