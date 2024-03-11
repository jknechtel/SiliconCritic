import os
import sys
import configparser

projPath = os.path.dirname(os.path.realpath(__file__))


def proj_path():
    return projPath


def save_result(res, problem):
    rpt = open(os.path.join(problem.work_dir, "moo_result.rpt"), "w")
    n_solution = len(res.X)
    for i in range(0, n_solution):
        rpt.write("**** Solution {} ****\n".format(i))
        rpt.write("Params: ")
        if problem.type == "shift":
            scales = []
            for j in list(res.X[i, 1:]):
                scales.append(1 if j == 0 else problem.scale_factor)
            rpt.write(
                "init_dens = {}, route_scales = {}\n".format(
                    problem.init_dens[res.X[i, 0]], scales
                )
            )
        else:
            scales = []
            for j in list(res.X[i, 2:]):
                scales.append(1 if j == 0 else problem.scale_factor)
            rpt.write(
                "(N, num_iter) = ({}, {}), route_scales = {}\n".format(
                    problem.N[res.X[i, 0]], problem.num_iters[res.X[i, 1]], scales
                )
            )
        rpt.write("Objs: Security = {}, ".format(res.F[i, 0]))
        rpt.write("TNS = {}\n".format(-res.F[i, 1]))
        rpt.write(
            "Constr: DRC vios = {}\n\n".format(int(res.G[i, 0] + problem.upperDRC))
        )
    rpt.close()


def Config(ini):
    config = configparser.ConfigParser()
    try:
        config.read(ini)
    except:
        print("Error: Fail to read config file %s" % ini)

    config = config["MOO"]
    args = dict()
    args["work_dir"] = config.get("work_dir")
    args["flow_type"] = config.get("flow_type")
    args["n_procs"] = config.getint("n_procs")

    args["pop_size"] = config.getint("pop_size")
    args["n_gen"] = config.getint("n_gen")

    args["baseline"] = eval(config.get("baseline"))

    return args
