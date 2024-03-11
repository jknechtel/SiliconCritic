import csv
import re

"""
*Example:
    ###############################################################
    # SETUP                 WNS     TNS   FEP   
    #------------------------------------------
     View : ALL          -0.031  -0.071     5  
"""


def parse_timingRpt(file):
    rpt = open(file)
    lines = rpt.readlines()
    pattern = re.compile(r"View : ALL\ +(\S+)\ +(\S+)\ +(\d+)")
    for line in lines:
        match = pattern.match(line.strip())
        if match:
            # return WNS (str), TNS (str)
            return float(match.groups()[0]), float(match.groups()[1])


"""
*Example:
    Total Power
    -----------------------------------------------------------------------------------------
    Total Internal Power:       35.74307329 	   53.6139%
    Total Switching Power:      30.15743091 	   45.2355%
    Total Leakage Power:         0.76706792 	    1.1506%
    Total Power:                66.66757215
"""


def parse_powerRpt(file):
    rpt = open(file)
    lines = rpt.readlines()
    pattern = re.compile(r"Total Power:\ +(\S+)")
    for line in lines:
        match = pattern.match(line.strip())
        if match:
            return float(match.groups()[0])


"""
H,Path,Clock,ReqTime,Slack,Startpoint Pin,Endpoint Pin
0 #ffff00,1, clk(leading)->clk(leading),0.963 ,-0.031 , s0_reg[89]/CK , r1/t1_t0_s4/out_reg[6]/D 
0 #ffff00,2, clk(leading)->clk(leading),0.976 ,-0.026 , r5/state_out_reg[95]/CK , r6/t1_t0_s0/out_reg[0]/D 
"""


def proc_delay_csv(delay_file):
    dict_delay = {}
    with open(delay_file) as f:
        reader = csv.DictReader(f)
        for row in reader:
            path = (row["Startpoint Pin"], row["Endpoint Pin"])
            delay = float(row["ReqTime"]) - float(row["Slack"])
            if delay > 0:  # Eliminate low-delay paths
                dict_delay[path] = delay
    return dict_delay


def parse_pathDelay(Tjin, dict_Tjfree):
    dict_Tjin = proc_delay_csv(Tjin)
    ratios = []
    for path, delay in dict_Tjin.items():
        delay_Tjfree = dict_Tjfree.get(path)
        if delay_Tjfree != None:
            ratios.append(delay / delay_Tjfree)
    return max(ratios)


"""
Region, Total Power, Leakage Power
(1-1), 0.8643, 0.01297
(1-2), 0.5566, 0.01318
"""


def proc_regionPower_csv(power_file):
    lst_power = []
    with open(power_file) as f:
        reader = csv.DictReader(f)
        for row in reader:
            total_power = float(row["Total Power"])
            leak_power = float(row["Leakage Power"])
            lst_power.append((total_power, leak_power))
    return lst_power


def parse_regionalPower(Tjin, lst_Tjfree):
    lst_Tjin = proc_regionPower_csv(Tjin)
    ratios_total, ratios_leak = [], []
    for tjfree, tjin in zip(lst_Tjfree, lst_Tjin):
        if tjin[0] > 0 and tjfree[0] > 0:
            ratios_total.append(tjin[0] / tjfree[0])
        if tjin[1] > 0 and tjfree[1] > 0:
            ratios_leak.append(tjin[1] / tjfree[1])
    return max(ratios_total), max(ratios_leak)


def write_rpt(lst, out_path):
    with open(out_path, "w") as out:
        for l in lst:
            out.write(f"{l}\n")
