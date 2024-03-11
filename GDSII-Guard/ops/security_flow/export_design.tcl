######
# Export Design
######

set_db write_def_lef_out_version 5.8
write_def -routing ${result_dir}/design.def
write_netlist ${result_dir}/design.v
