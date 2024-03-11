import sys
import csv
import json
from pyverilog.vparser.parser import parse
import itertools


def parse_trojan_netlist(tj_netlist):
    ast, _ = parse([tj_netlist])
    tj_inputs, tj_outputs = [], []
    stack = [ast]
    while stack:
        node = stack.pop()
        if node.__class__.__name__ == "ModuleDef":
            vlist = [getattr(node, n) for n in node.attr_names]
            trojan_module = vlist[0]
        if node.__class__.__name__ == "Input":
            vlist = [getattr(node, n) for n in node.attr_names]
            tj_inputs.append(vlist[0])
        if node.__class__.__name__ == "Output":
            vlist = [getattr(node, n) for n in node.attr_names]
            tj_outputs.append(vlist[0])

        stack.extend(node.children())

    tj_inputs.reverse()
    tj_outputs.reverse()
    return trojan_module, tj_inputs, tj_outputs


def get_schemes(net_toggle_csv, tj_netlist, config_json, scheme_csv, topk=10):
    candidate_signals = []
    first_line = True
    with open(net_toggle_csv, "r") as f:
        reader = csv.reader(f)
        for row in reader:
            if not first_line and topk > 0:
                candidate_signals.append(row[0])
                topk -= 1
            first_line = False

    trojan_module, tj_inputs, tj_outputs = parse_trojan_netlist(tj_netlist)

    with open(config_json, "r") as f:
        config = json.load(f)
    config_keys = list(config.keys())

    for port in tj_outputs:
        if not port in config_keys:
            raise Exception(
                f"Each output port of Trojan should have a corresponding entry in {config_json}. Get by attack objectives or SCOAP"
            )

    config_ports, config_signals = [], []
    for port in config:
        signals = config[port]
        config_ports.append(port)
        config_signals.append(signals)
    config_combs = list(itertools.product(*config_signals))

    n_ports_auto = len(tj_inputs) + len(tj_outputs) - len(config_keys)

    auto_combs = [()]
    if n_ports_auto > 0:
        auto_combs = list(itertools.combinations(candidate_signals, n_ports_auto))

    trojan_info = {
        "module_name": trojan_module,
        "inputs": tj_inputs,
        "outputs": tj_outputs,
        "schemes": [],
    }

    for config_comb in config_combs:
        for auto_comb in auto_combs:
            auto_comb = list(auto_comb)
            scheme = []
            for port in tj_inputs + tj_outputs:
                if port in config_ports:
                    scheme.append(config_comb[config_ports.index(port)])
                else:
                    scheme.append(auto_comb.pop())
            trojan_info["schemes"].append(scheme)

    with open(scheme_csv, "w") as f:
        writer = csv.writer(f)
        writer.writerow(trojan_info["inputs"] + trojan_info["outputs"])
        for scheme in trojan_info["schemes"]:
            writer.writerow(scheme)

    return trojan_info


if __name__ == "__main__":
    args = sys.argv[1:]
    if len(args) != 4:
        print(
            "Usage: python get_schemes.py <net_toggle_csv> <tj_netlist> <config_json> <scheme_csv>"
        )
        raise Exception("Invalid args")

    net_toggle_csv, tj_netlist, config_json, scheme_csv = args
    get_schemes(net_toggle_csv, tj_netlist, config_json, scheme_csv)
