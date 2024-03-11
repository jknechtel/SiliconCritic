from pyverilog.vparser.parser import parse
import sys


def find_endlineno_of_module(ast, module_name):
    stack = [ast]
    while stack:
        node = stack.pop()
        if node.__class__.__name__ == "ModuleDef":
            vlist = [getattr(node, n) for n in node.attr_names]
            if vlist[0] == module_name:
                return node.end_lineno
        stack.extend(node.children())


def netlist_merge(
    Tjfree_netlist, Tjin_netlist, Trojan_netlist, topmodule, trojan_instance_line
):
    ast, directives = parse([Tjfree_netlist])
    lineno_endmodule = find_endlineno_of_module(ast, topmodule)
    assert lineno_endmodule is not None

    # print("endlineno of top module", lineno_endmodule)
    with open(Trojan_netlist, "r") as f:
        trojan_lines = f.readlines()
    with open(Tjfree_netlist, "r") as f:
        lines = f.readlines()

    lines.insert(lineno_endmodule - 1, trojan_instance_line + "\n\n")

    lines = trojan_lines + ["\n\n"] + lines

    with open(Tjin_netlist, "w") as f:
        f.writelines(lines)


if __name__ == "__main__":
    assert len(sys.argv) == 5
    Tjfree_netlist = sys.argv[1]
    Tjin_netlist = sys.argv[2]
    Trojan_netlist = sys.argv[3]
    topmodule = sys.argv[4]
    trojan_instance_line = sys.argv[5]

    netlist_merge(
        Tjfree_netlist, Tjin_netlist, Trojan_netlist, topmodule, trojan_instance_line
    )
