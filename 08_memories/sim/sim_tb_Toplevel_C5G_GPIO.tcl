vlib work
vmap work work

#defina all sources that need to be compiled
vlog ../src/*.sv
vlog ../ip/memory_quartus.v
vlog ../fpga/Toplevel_C5G_GPIO.sv

#define the testbench that needs to be compiled
vlog tb_Toplevel_C5G_GPIO.sv


vsim -L altera_mf_ver -L lpm_ver tb_Toplevel_C5G_GPIO

do wave_tb_Toplevel_C5G_GPIO.tcl

log -r *

run -all


view wave
wave zoomfull