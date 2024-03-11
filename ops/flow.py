import os
import subprocess
from multiprocessing import Pool
from ops.py.proc_tcf import proc_tcf
from ops.py.get_schemes import get_schemes
from ops.py.netlist_merge import netlist_merge
from ops.py.batch_eco import convert_trojan_module, run_eco
from ops.py.get_metrics import (
    parse_timingRpt,
    parse_powerRpt,
    proc_delay_csv,
    parse_pathDelay,
    proc_regionPower_csv,
    parse_regionalPower,
    write_rpt,
)


class SiliconCritic:
    def __init__(self, config, project_root):
        self.config = config
        self.project_root = project_root
        self.work_dir = (
            config.work_dir
            if os.path.isabs(config.work_dir)
            else os.path.join(project_root, config.work_dir)
        )
        self.tj_dir = os.path.join(self.work_dir, "trojan")
        os.makedirs(self.tj_dir, exist_ok=True)
        self.ops_dir = os.path.dirname(os.path.abspath(__file__))
        self.tcl_dir = os.path.join(self.ops_dir, "tcl")

    def preprocess_design(self):
        ## Create mmmc.tcl
        mmmc_path = os.path.join(self.work_dir, "mmmc.tcl")
        mmmc_template = os.path.join(self.tcl_dir, "mmmc.tcl")
        with open(mmmc_template, "r") as f:
            mmmc_template_content = f.readlines()
        self.lib_path = (
            self.config.lib_path
            if os.path.isabs(self.config.lib_path)
            else os.path.join(self.project_root, self.config.lib_path)
        )
        with open(mmmc_path, "w") as f:
            sdc_path = (
                self.config.sdc_path
                if os.path.isabs(self.config.sdc_path)
                else os.path.join(self.project_root, self.config.sdc_path)
            )
            f.write(f"set lib {self.lib_path}\n")
            f.write(f"set sdc {sdc_path}\n\n")
            f.write("".join(mmmc_template_content))

        ## Import original design and process
        preproc_tcl_path = os.path.join(self.work_dir, "proc_Tjfree.tcl")
        preproc_tcl_template = os.path.join(self.tcl_dir, "proc_Tjfree.tcl")
        with open(preproc_tcl_template, "r") as f:
            preproc_tcl_template_content = f.readlines()
        self.lef_path = (
            self.config.lef_path
            if os.path.isabs(self.config.lef_path)
            else os.path.join(self.project_root, self.config.lef_path)
        )
        with open(preproc_tcl_path, "w") as f:
            f.write(f"read_mmmc {mmmc_path}\n")
            f.write(f"read_physical -lefs {self.lef_path}\n")
            netlist_path = (
                self.config.netlist_path
                if os.path.isabs(self.config.netlist_path)
                else os.path.join(self.project_root, self.config.netlist_path)
            )
            f.write(f"read_netlist {netlist_path}\n")
            def_path = (
                self.config.def_path
                if os.path.isabs(self.config.def_path)
                else os.path.join(self.project_root, self.config.def_path)
            )
            f.write(f"read_def {def_path}\n")
            f.write(f"init_design\n\n")

            f.write("".join(preproc_tcl_template_content))

        p = subprocess.Popen(
            f"innovus -stylus -files {preproc_tcl_path} -no_cmd -no_logv -log LOG/innovus.log -no_gui",
            cwd=self.work_dir,
            shell=True,
        )
        assert p.wait() == 0, "Preprocessing failed"

    def Trojan_synth(self):
        synth_tcl = os.path.join(self.tj_dir, "synth.tcl")
        synth_template = os.path.join(self.tcl_dir, "synth_tj.tcl")
        with open(synth_template, "r") as f:
            synth_template_content = f.readlines()
        trojan_rtl = (
            self.config.trojan_rtl
            if os.path.isabs(self.config.trojan_rtl)
            else os.path.join(self.project_root, self.config.trojan_rtl)
        )
        with open(synth_tcl, "w") as f:
            f.write(f"set hdl_files {trojan_rtl}\n")
            f.write(f"set lib_path {self.lib_path}\n\n")
            f.writelines(synth_template_content)
        p = subprocess.Popen(
            f"genus -legacy_ui -batch -log LOG/genus.log -files {synth_tcl}",
            cwd=self.tj_dir,
            shell=True,
        )
        assert p.wait() == 0, "Trojan synthesis failed"
        self.tj_netlist = os.path.join(self.tj_dir, "Trojan.vh")

    def get_schemes(self):
        tcf_path = os.path.join(self.work_dir, "reports/net_toggle.tcf")
        rpt_path = os.path.join(self.work_dir, "reports/net_toggle.csv")
        proc_tcf(tcf_path, rpt_path)

        config_json = (
            self.config.config_json
            if os.path.isabs(self.config.config_json)
            else os.path.join(self.project_root, self.config.config_json)
        )
        # Trojan info has the following structure:
        # {
        #     "module_name": "trojan_module",
        #     "inputs": ["in1", "in2"],
        #     "outputs": ["out1", "out2"],
        #     "schemes": [
        #         ["in1_0, in2_0, out1_0, out2_0"],
        #         ["in1_1, in2_1, out1_1, out2_1"],
        #     ]
        # }
        self.trojan_info = get_schemes(
            rpt_path,
            self.tj_netlist,
            config_json,
            os.path.join(self.work_dir, "reports/schemes.csv"),
            topk=10,
        )

    def batch_eco(self):
        print("Writing attack netlists...")
        trojan_ports = self.trojan_info["inputs"] + self.trojan_info["outputs"]
        for i, scheme in enumerate(self.trojan_info["schemes"]):
            os.makedirs(
                os.path.join(self.work_dir, "attacks", str(i + 1)), exist_ok=True
            )
            Tjin_netlist = os.path.join(
                self.work_dir, "attacks", str(i + 1), "design_Tjin.vh"
            )
            Tjfree_netlist = os.path.join(self.work_dir, "design_Tjfree.vh")

            trojan_instance = convert_trojan_module(trojan_ports, scheme)

            netlist_merge(
                Tjfree_netlist,
                Tjin_netlist,
                self.tj_netlist,
                self.config.top_module,
                trojan_instance,
            )
        os.system("rm -f parser.out parsetab.py")
        dirs = os.listdir(os.path.join(self.work_dir, "attacks"))
        pool = Pool(self.config.n_procs)
        eco_tcl = os.path.join(self.tcl_dir, "eco_tj.tcl")
        for dir in dirs:
            pool.apply_async(
                run_eco,
                args=(
                    os.path.join(self.work_dir, "attacks", dir),
                    eco_tcl,
                ),
            )
        pool.close()
        pool.join()

    def get_metrics(self):
        (
            tns,
            power,
            delay,
            region_power_tot,
        ) = (
            [],
            [],
            [],
            [],
        )
        delays_Tjfree = proc_delay_csv(
            os.path.join(self.work_dir, "reports/path_delay.csv")
        )
        region_power_Tjfree = proc_regionPower_csv(
            os.path.join(self.work_dir, "reports/regional_power.csv")
        )
        dirs = os.listdir(os.path.join(self.work_dir, "attacks"))
        for dir in dirs:
            timing_rpt = os.path.join(
                self.work_dir, f"attacks/{dir}/reports/timing.rpt"
            )
            power_rpt = os.path.join(self.work_dir, f"attacks/{dir}/reports/power.rpt")
            delay_rpt = os.path.join(
                self.work_dir, f"attacks/{dir}/reports/path_delay.csv"
            )
            region_power_rpt = os.path.join(
                self.work_dir, f"attacks/{dir}/reports/regional_power.csv"
            )

            try:
                _wns, _tns = parse_timingRpt(timing_rpt)
                _power = parse_powerRpt(power_rpt)
                _delay = parse_pathDelay(delay_rpt, delays_Tjfree)
                _region_power_tot, _region_power_leak = parse_regionalPower(
                    region_power_rpt, region_power_Tjfree
                )

                tns.append(_tns)
                power.append(_power)
                delay.append(_delay)
                region_power_tot.append(_region_power_tot)
            except FileNotFoundError:  # No reports generated
                print(
                    f"Cannot read reports in dir [{dir}], check the LOG for more information."
                )
                continue
            except:
                print(
                    f"Error occurs in dir [{dir}], check the LOG for more information."
                )
                continue

        tns.sort()
        power.sort(reverse=True)
        delay.sort(reverse=True)
        region_power_tot.sort(reverse=True)

        os.makedirs(os.path.join(self.work_dir, "reports_total"), exist_ok=True)
        write_rpt(tns, os.path.join(self.work_dir, "reports_total/tns.rpt"))
        write_rpt(power, os.path.join(self.work_dir, "reports_total/total_power.rpt"))
        write_rpt(delay, os.path.join(self.work_dir, "reports_total/path_delay.rpt"))
        write_rpt(
            region_power_tot,
            os.path.join(self.work_dir, "reports_total/regional_power.rpt"),
        )

    def print_welcome(self):
        content = """\
=========================================================
                    SiliconCritic
    - IC Security Evaluation against Trojan Attacks -
========================================================="""

        print(content)

    def run(self):
        self.print_welcome()
        self.preprocess_design()
        self.Trojan_synth()
        self.get_schemes()
        self.batch_eco()
        self.get_metrics()
