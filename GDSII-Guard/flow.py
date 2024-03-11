import os
import subprocess
import util


class Flow:

    def __init__(self, work_dir):
        self.work_dir = work_dir
        self.base_name = ""
        self.tcl_name = ""
        self.eval_name = ""
        self.result_dir = ""
        self.type = "shift"  # "shift" / "dens"
        self.params = dict()

    def __str__(self):
        if self.type == "shift":
            return "(Shift) init_dens={} route_scales={}".format(
                self.params["init_dens"], self.params["width_scales"]
            )
        else:
            return "(Dens) N={} num_iter={} route_scales={}".format(
                self.params["N"], self.params["num_iter"], self.params["width_scales"]
            )

    def config_shift(self, dens):
        self.type = "shift"
        self.params["init_dens"] = dens

    def config_dens(self, N, num_iter):
        self.type = "dens"
        self.params["N"] = N
        self.params["num_iter"] = num_iter

    def config_route(self, scale_lst):
        self.params["width_scales"] = scale_lst

    def set_base_name(self):
        if self.type == "shift":
            self.base_name = "_{}_".format(self.params["init_dens"])
        else:
            self.base_name = "_{}_{}_".format(self.params["N"], self.params["num_iter"])
        for i, scale in enumerate(self.params["width_scales"]):
            if i < len(self.params["width_scales"]) - 1:
                self.base_name += "{}_".format(scale)
            else:
                self.base_name += "{}".format(scale)

        self.result_dir = os.path.join(self.work_dir, "result" + self.base_name)

    def write_tcl(self, script_dir):
        self.set_base_name()

        self.tcl_name = "run" + self.base_name + ".tcl"
        tcl = open(os.path.join(self.work_dir, self.tcl_name), "w", encoding="utf-8")
        tcl.write("source {}\n".format(os.path.join(script_dir, "import_design.tcl")))
        tcl.write("source {}\n".format(os.path.join(script_dir, "get_layer_info.tcl")))

        if self.type == "shift":
            tcl.write("source {}\n".format(os.path.join(script_dir, "gate_upsize.tcl")))
            tcl.write("gate_upsize {}\n".format(self.params["init_dens"]))
            tcl.write("source {}\n".format(os.path.join(script_dir, "cell_shift.tcl")))
        else:
            tcl.write("source {}\n".format(os.path.join(script_dir, "tile_dens.tcl")))
            tcl.write(
                "tile_dens_adjust {} {}\n".format(
                    self.params["N"], self.params["num_iter"]
                )
            )

        scales_str = "set width_scales [list "
        for i, scale in enumerate(self.params["width_scales"]):
            if i < len(self.params["width_scales"]) - 1:
                scales_str += "{} ".format(scale)
            else:
                scales_str += "{}]\n".format(scale)

        tcl.write(scales_str)
        tcl.write("source {}\n".format(os.path.join(script_dir, "route_opt.tcl")))

        tcl.write("set result_dir {}\n".format(self.result_dir))
        tcl.write("source {}\n".format(os.path.join(script_dir, "export_design.tcl")))
        tcl.write("exit\n")
        tcl.close()

    def write_eval(self, script_dir):
        self.set_base_name()

        self.eval_name = "eval" + self.base_name + ".tcl"
        tcl = open(os.path.join(self.work_dir, self.eval_name), "w", encoding="utf-8")

        tcl.write("set result_dir {}\n".format(self.result_dir))
        tcl.write("source {}\n".format(os.path.join(script_dir, "init_eval.tcl")))
        tcl.write(
            "source {}\n".format(os.path.join(script_dir, "get_metal_layers.tcl"))
        )
        tcl.write("set num_layers [get_metal_layers ]\n")
        tcl.write("source {}\n".format(os.path.join(script_dir, "exploit_regions.tcl")))
        tcl.write("exit\n")
        tcl.close()


## For multiprocessing task
def proc_flow(flow):
    print("Run and evaluate security flow: ", flow)
    cmd0 = "innovus -stylus -files {} -no_cmd -no_logv -log {} > /dev/null 2>&1".format(
        flow.tcl_name, os.path.join(flow.result_dir, "LOG/innovus.log")
    )
    cmd1 = "innovus -stylus -files {} -no_cmd -no_logv -log {} > /dev/null 2>&1".format(
        flow.eval_name, os.path.join(flow.result_dir, "LOG/eval.log")
    )
    cmd2 = "{} {} > /dev/null 2>&1".format(
        os.path.join(util.proj_path(), "opt/eval/post_process_exploit_regions.sh"),
        flow.result_dir,
    )
    cmd3 = "{} {}".format(
        os.path.join(util.proj_path(), "opt/eval/write_summary.sh"), flow.result_dir
    )
    cmd = cmd0 + " && " + cmd1 + " && " + cmd2 + " && " + cmd3

    proc = subprocess.Popen(cmd, cwd=flow.work_dir, shell=True)
    proc.wait()
    print("Finish security flow: ", flow)


## Run a single security flow
def run_flow(flow):
    print("Running security flow:", flow)
    cmd = "innovus -stylus -files {} -no_cmd -no_logv -log {} > /dev/null 2>&1".format(
        flow.tcl_name, os.path.join(flow.result_dir, "LOG/innovus.log")
    )

    sec_flow = subprocess.Popen(cmd, cwd=flow.work_dir, shell=True)
    sec_flow.wait()
    assert sec_flow.poll() == 0, "Security flow {} fails".format(str(flow))
    print("Security flow [{}] succeeded.".format(str(flow)))


## Run a single eval flow
def run_eval(flow):
    print("Evaluating flow:", flow)
    cmd1 = "innovus -stylus -files {} -no_cmd -no_logv -log {} > /dev/null 2>&1".format(
        flow.eval_name, os.path.join(flow.result_dir, "LOG/eval.log")
    )
    cmd2 = "{} {} > /dev/null 2>&1".format(
        os.path.join(util.proj_path(), "opt/eval/post_process_exploit_regions.sh"),
        flow.result_dir,
    )
    cmd3 = "{} {}".format(
        os.path.join(util.proj_path(), "opt/eval/write_summary.sh"), flow.result_dir
    )

    eval_p = subprocess.Popen(
        cmd1 + " && " + cmd2 + " && " + cmd3, cwd=flow.work_dir, shell=True
    )
    eval_p.wait()
    assert eval_p.poll() == 0, "Eval flow {} fails".format(str(flow))
    print("Eval flow [{}] succeeded.".format(str(flow)))


def get_metrics(flow):
    metrics = dict()
    rpt = open(os.path.join(flow.result_dir, "reports/summary.rpt"), "r")
    lines = rpt.readlines()
    metrics["n_sites"] = int((lines[0].split())[-1])
    metrics["n_tracks"] = int((lines[1].split())[-1])
    metrics["tns"] = float((lines[2].split())[-1])
    metrics["drc"] = int((lines[3].split())[-1])
    metrics["power"] = float((lines[4].split())[-1])
    metrics["area"] = float((lines[5].split())[-1])
    rpt.close()
    # print(metrics)
    return metrics
