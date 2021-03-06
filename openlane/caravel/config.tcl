# User config
set script_dir [file dirname [file normalize [info script]]]

set ::env(PDK) "sky130A"
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hvl"


set ::env(DESIGN_NAME) caravel

set verilog_root $script_dir/../../verilog/
set lef_root $script_dir/../../lef/
set gds_root $script_dir/../../gds/
# Change if needed
set ::env(VERILOG_FILES) "\
	$verilog_root/rtl/caravel.v"

set ::env(SYNTH_READ_BLACKBOX_LIB) 1

set ::env(VERILOG_FILES_BLACKBOX) "\
	$verilog_root/rtl/defines.v \
	$verilog_root/rtl/pads.v \
	$verilog_root/rtl/chip_io.v \
	$verilog_root/rtl/mgmt_core.v \
	$verilog_root/rtl/storage.v \
	$verilog_root/rtl/user_project_wrapper.v \
	$verilog_root/rtl/mgmt_protect.v \
	$verilog_root/rtl/gpio_control_block.v \
	$verilog_root/rtl/user_id_programming.v \
	$verilog_root/rtl/simple_por.v"

set ::env(EXTRA_LEFS) "\
	$lef_root/chip_io.lef \
	$lef_root/mgmt_core.lef \
	$lef_root/storage.lef \
	$lef_root/user_project_wrapper.lef \
	$lef_root/mgmt_protect.lef \
	$lef_root/gpio_control_block.lef \
	$lef_root/user_id_programming.lef \
	$lef_root/simple_por.lef"

set ::env(EXTRA_GDS_FILES) "\
	$gds_root/chip_io.gds \
	$gds_root/mgmt_core.gds \
	$gds_root/storage.gds \
	$gds_root/user_project_wrapper.gds \
	$gds_root/mgmt_protect.gds \
	$gds_root/gpio_control_block.gds \
	$gds_root/user_id_programming.gds \
	$gds_root/simple_por.gds"

# # !!!
# if { [info exists ::env(LVS_RUN_DIR)] || [info exists ::env(CONNECTIVITY_RUN)] } {
# 	# if running to get a full floorplan, need the original pads due to
# 	# missing pins in the abstracted version
# 	set ::env(GPIO_PADS_LEF) [glob "$::env(PDK_ROOT)/$::env(PDK)/libs.ref/lef/s8iom0s8/*.lef"]
# }

set ::env(SYNTH_TOP_LEVEL) 1
set ::env(SYNTH_FLAT_TOP) 1
set ::env(LEC_ENABLE) 0

set ::env(FP_SIZING) absolute

set fd [open "$script_dir/../chip_dimensions.txt" "r"]
set ::env(DIE_AREA) [read $fd]
close $fd


set ::env(CELL_PAD) 0
set ::env(PL_OPENPHYSYN_OPTIMIZATIONS) 0

set ::env(DIODE_INSERTION_STRATEGY) 0

set ::env(GLB_RT_ALLOW_CONGESTION) 1
set ::env(GLB_RT_OVERFLOW_ITERS) 50
set ::env(GLB_RT_TILES) 15

set ::env(FILL_INSERTION) 0

# DON'T PUT CELLS ON THE TOP LEVEL
set ::env(LVS_INSERT_POWER_PINS) 0
