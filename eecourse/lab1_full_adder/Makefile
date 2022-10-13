run: compile simulate

compile:
	vcs -debug_access -debug_access+class -debuc_access+all -debug_acc+all -debug_region+cell+encrypt -v -sverilog timescale.v full_adder.v full_adder_tb.v -l com.log 
	
simulate:
	./simv -l sim.log

run_cov: compile_coverage simulate_coverage

compile_coverage:
	vcs -debug_acc+all -debug_region+cell+encrypt -cm line+cond+fsm+tgl+branch -lca timescale.v full_adder.v full_adder_tb.v -l com.log

simulate_coverage:
	./simv -cm line+cond+fsm+tgl+branch -lca -cm_log com.log -l sim.log

report_cov:
	urg -dir simv.vdb -format both report coverage

dve_cov:
	dve -cov -covdir simv.vdb -lca

clean:
	rm -rf *.log csrc simv simv.daidir ucli.key vcdplus.vpd DVEfiles coverage simv.vdb
