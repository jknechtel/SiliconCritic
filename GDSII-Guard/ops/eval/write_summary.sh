result_dir=$1

grep "Total sites across regions:" ${result_dir}/reports/exploit_regions.rpt | awk '{print "Total free sites: " $5}' > ${result_dir}/reports/summary.rpt

grep "Total free tracks across regions:" ${result_dir}/reports/exploit_regions.rpt | awk '{print "Total free tracks: " $6}' >> ${result_dir}/reports/summary.rpt

grep "ALL" ${result_dir}/reports/timing.rpt | awk '{print "TNS for setup(ps): " $5}' >> ${result_dir}/reports/summary.rpt

grep "Verification Complete :" ${result_dir}/reports/drc.rpt | awk '{print "DRC Viols: " $4}' >> ${result_dir}/reports/summary.rpt

grep "Total Power:" ${result_dir}/reports/power.rpt | awk '{print "Total Power(mW): " $3}' >> ${result_dir}/reports/summary.rpt

grep "." ${result_dir}/reports/area.rpt | awk '{print "Die area(um^2): " $0}' >> ${result_dir}/reports/summary.rpt


