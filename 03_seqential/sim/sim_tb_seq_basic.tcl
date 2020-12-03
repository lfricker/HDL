vlib work
vmap work work


vlog ../src/seq_basic.sv

vlog tb_seq_basic.sv


vsim tb_seq_basic

do wave_sim_tb_seq_basic.tcl

log -r *

run -all


view wave
wave zoomfull