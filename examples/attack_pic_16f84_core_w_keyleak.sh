#!/bin/bash

python main.py --work_dir work_pic16f84core \
    --sdc_path examples/pic_16f84_core/pic_16f84_core.sdc \
    --netlist_path examples/pic_16f84_core/pic_16f84_core.vh \
    --def_path examples/pic_16f84_core/pic_16f84_core.def \
    --trojan_rtl examples/keyleak/Trojan.v \
    --config_json examples/pic_16f84_core/config.json \
    --top_module pic_16f84_core \
    --n_procs 8