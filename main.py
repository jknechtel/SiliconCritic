import argparse
import os
from ops.flow import SiliconCritic

parser = argparse.ArgumentParser()
parser.add_argument("--work_dir", required=True, help="Path to the working directory")
parser.add_argument(
    "--lib_path",
    default="lib/NangateOpenCellLibrary.lib",
    help="Path to the cell PPA library (.lib)",
)
parser.add_argument(
    "--lef_path",
    default="lib/NangateOpenCellLibrary.lef",
    help="Path to the cell physical library (.lef)",
)
parser.add_argument("--sdc_path", required=True, help="Path to the SDC file")
parser.add_argument("--netlist_path", required=True, help="Path to the design netlist")
parser.add_argument("--def_path", required=True, help="Path to the design DEF file")
parser.add_argument("--trojan_rtl", required=True, help="Path to the trojan RTL")
parser.add_argument(
    "--config_json",
    required=True,
    help="Path to the configuration JSON file for attack schemes",
)
parser.add_argument(
    "--top_module",
    required=True,
    help="Name of top module to be exploited of the design",
)
parser.add_argument(
    "--n_procs", type=int, default=4, help="Number of parallel processes to be used"
)

if __name__ == "__main__":
    args = parser.parse_args()
    root = os.path.dirname(os.path.abspath(__file__))
    sc = SiliconCritic(args, root)
    sc.run()
