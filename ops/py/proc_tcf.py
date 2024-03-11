import sys
import re
import heapq


def proc_tcf(tcf_path, rpt_path, topk=20):
    """Process tcf file and find topk nets with lowest transition prob.

    Args:
        tcf_path (string): path to tcf file
        rpt_path (string): path to output report
        topk (int, optional): top<num>. Defaults to 20.
    """
    tcf = open(tcf_path)
    line = tcf.readline()
    heap = []  # Min heap in default
    while line:
        line = line.strip()
        ## Example line: "r6/t3_t3_s4/n_299" : "0.968800 62500000";
        pattern = re.compile(r'"(\S+)" : "(\S+) (\d+)";')
        match = pattern.match(line)
        if match:
            match_g = match.groups()
            if not "/" in str(match_g[0]):
                if len(heap) < topk:
                    heapq.heappush(heap, (-int(match_g[2]), match_g[0], match_g[1]))
                else:
                    heapq.heappushpop(heap, (-int(match_g[2]), match_g[0], match_g[1]))
        line = tcf.readline()

    heap.sort(key=lambda x: x[0], reverse=True)
    rpt = open(rpt_path, "w")
    print("Net Name         Toggle Count     Prob_1")
    rpt.write("Net Name,        Toggle Count,      Prob_1\n")
    for h in heap:
        print(f"{h[1]}  {-h[0]}     {h[2]}")
        rpt.write(f"{h[1]}, {-h[0]}, {h[2]}\n")
    tcf.close()
    rpt.close()


if __name__ == "__main__":
    args = sys.argv[1:]
    if len(args) != 1:
        print("Usage: python proc_tcf.py <path_to_tcf_file>")
        raise Exception("Invalid args")

    tcf_path = args[0]
    # rpt_path = args[1]
    rpt_path = "reports/net_toggle.csv"
    proc_tcf(tcf_path, rpt_path, 200)
