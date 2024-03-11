import numpy as np
from pymoo.core.problem import Problem, ElementwiseProblem
from multiprocessing import Process, Pool
from flow import *
import util


class Trojan(Problem):

    def __init__(self, type, work_dir, baseline, n_procs=20):
        if type == "shift":
            xl = np.append(
                np.array([0], dtype=np.int64),
                np.zeros(baseline["n_layer"], dtype=np.int64),
            )
            xu = np.append(
                np.array([4], dtype=np.int64),
                np.ones(baseline["n_layer"], dtype=np.int64),
            )
        else:
            xl = np.append(
                np.array([0, 0], dtype=np.int64),
                np.zeros(baseline["n_layer"], dtype=np.int64),
            )
            xu = np.append(
                np.array([4, 2], dtype=np.int64),
                np.ones(baseline["n_layer"], dtype=np.int64),
            )

        super().__init__(n_var=len(xl), n_obj=2, n_constr=1, xl=xl, xu=xu, type_var=int)
        self.type = type
        self.work_dir = work_dir
        self.baseline = baseline
        self.n_procs = n_procs
        self.upperDRC = 40 if baseline["drc"] <= 20 else round(1.5 * baseline["drc"])

        ## Define parameter space
        self.init_dens = [0.65, 0.70, 0.75, 0.80, 0.85]
        self.N = [2, 4, 8, 16, 32]
        self.num_iters = [1, 2, 3]
        self.scale_factor = 1.1

    def _evaluate(self, x, out, *args, **kwargs):
        ## Vectorized: x.shape = (pop_size, n_var) if inherited from Pymoo Problem
        flows = self.get_obj(x)
        objs, constrs = [], []
        for flow in flows:
            res = get_metrics(flow)
            sec = 0.6 * (res["n_sites"] / self.baseline["n_sites"]) + 0.4 * (
                res["n_tracks"] / self.baseline["n_tracks"]
            )
            timing = -res["tns"]
            drc = res["drc"] - self.upperDRC

            objs.append([sec, timing])
            constrs.append([drc])

        ## out["F"].shape = (pop_size, n_objs)
        ## out["G"].shape = (pop_size, n_constrs)
        out["F"] = np.array(objs)
        out["G"] = np.array(constrs)

    def get_obj(self, x):
        flows = []
        for xi in x:
            flow = Flow(self.work_dir)
            if self.type == "shift":
                flow.config_shift(self.init_dens[xi[0]])
                scales = []
                for i in list(xi[1:]):
                    scales.append(1 if i == 0 else self.scale_factor)
                flow.config_route(scales)
            else:
                flow.config_dens(self.N[xi[0]], self.num_iters[xi[1]])
                scales = []
                for i in list(xi[2:]):
                    scales.append(1 if i == 0 else self.scale_factor)
                flow.config_route(scales)
            flow.write_tcl(os.path.join(util.proj_path(), "opt/security_flow"))
            flow.write_eval(os.path.join(util.proj_path(), "opt/eval"))
            flows.append(flow)

        ## Parallel # self.n_procs processes
        pool = Pool(self.n_procs)
        for flow in flows:
            pool.apply_async(proc_flow, args=(flow,))
        pool.close()
        pool.join()

        return flows
