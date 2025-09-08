set_attribute lib_search_path {/home/install/FOUNDRY/digital/180nm/dig/lib}
set_attribute hdl_search_path {../rtl1/}
set_attribute library {slow.lib}
read_hdl alu.v
elaborate
read_sdc constraint.sdc

set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

#reports
report_timing > reports/report_timing.rpt
report_power  > reports/report_power.rpt
report_area   > reports/report_area.rpt
report_qor    > reports/report_qor.rpt



#Outputs
write_hdl > outputs/alu_netlist.v
write_sdc > outputs/alu_sdc.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > outputs/delays.sdf
