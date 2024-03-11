# set lib <lib_path>
# set sdc <sdc_path>

## library_sets
create_library_set -name generic_library_set \
    -timing $lib

## opcond
create_opcond -name generic_opcond -process 1.0 -voltage 1.1 -temperature 25.0

## timing_condition
create_timing_condition -name generic_timing_cond \
    -opcond generic_opcond \
    -library_sets { generic_library_set }

## rc_corner
create_rc_corner -name generic_rc_corner \
    -temperature 25.0 \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0}

## delay_corner
create_delay_corner -name generic_delay_corner \
    -early_timing_condition { generic_timing_cond } \
    -late_timing_condition { generic_timing_cond } \
    -early_rc_corner generic_rc_corner \
    -late_rc_corner generic_rc_corner

## constraint_mode
create_constraint_mode -name generic_constraints \
    -sdc_files $sdc

## analysis_view
create_analysis_view -name generic_view \
    -constraint_mode generic_constraints \
    -delay_corner generic_delay_corner

## set_analysis_view
set_analysis_view -setup { generic_view } \
                  -hold { generic_view }
