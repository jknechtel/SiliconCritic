import time
import os
import sys

from pymoo.factory import get_algorithm, get_crossover, get_mutation, get_sampling
from pymoo.optimize import minimize

from moo import Trojan
import util


if __name__ == "__main__":

    if len(sys.argv) != 2:
        print("ERROR: Invalid command line arguments")
        print("Usage: python main.py /path/to/your/config.ini")
        exit(1)
    config_ini = sys.argv[1]
    args = util.Config(config_ini)

    algo = get_algorithm(
        "nsga2",
        pop_size=args["pop_size"],
        sampling=get_sampling("int_random"),
        crossover=get_crossover("int_sbx", prob=1.0, eta=1.0),
        mutation=get_mutation("int_pm", eta=1.0),
    )

    problem = Trojan(
        type=args["flow_type"],
        work_dir=args["work_dir"],
        baseline=args["baseline"],
        n_procs=args["n_procs"],
    )

    print(
        "Security Param Opt begins at: ",
        time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time())),
    )
    res = minimize(problem, algo, ("n_gen", args["n_gen"]), seed=1, verbose=True)

    util.save_result(res, problem)
    print(
        "Opt results have been saved to {}".format(
            os.path.join(args["work_dir"], "moo_result.rpt")
        )
    )
    print(
        "Security Param Opt ends at: ",
        time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(time.time())),
    )
