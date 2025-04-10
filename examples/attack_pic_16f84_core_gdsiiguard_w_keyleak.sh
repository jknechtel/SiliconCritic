#!/bin/bash

python3 main.py --work_dir work_pic16f84core_gdsiiguard \
    --sdc_path examples/pic_16f84_core_gdsiiguard/pic_16f84_core.sdc \
    --netlist_path examples/pic_16f84_core_gdsiiguard/pic_16f84_core.vh \
    --def_path examples/pic_16f84_core_gdsiiguard/pic_16f84_core.def \
    --trojan_rtl examples/keyleak/Trojan.v \
    --config_json examples/pic_16f84_core_gdsiiguard/config.json \
    --top_module pic_16f84_core \
    --n_procs 30
