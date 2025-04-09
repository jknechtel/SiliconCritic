import subprocess


def convert_trojan_module(ports, candidates):
    assert len(ports) == len(candidates), "Unmatched <ports, candidates> pair!"
    n_ports = len(ports)
    trojan_line = "Trojan trojan ("
    for i in range(n_ports):
        trojan_line += f".{ports[i]}({candidates[i]})"
        if i < n_ports - 1:
            trojan_line += ", "
    trojan_line += ");\n"
    return trojan_line


def run_eco(design_dir, eco_tcl):
    print(f"Run ECO and eval: {design_dir}")
    cmd = f"innovus -wait 720 -stylus -files {eco_tcl} -no_cmd -no_logv -log LOG/innovus -no_gui > /dev/null 2>&1"
    proc = subprocess.Popen(cmd, cwd=design_dir, shell=True)
    assert proc.wait() == 0, f"ECO failed in {design_dir}!"
