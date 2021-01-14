vlib work
vmap work work


vlog ../src/memory.sv

vlog tb_memory.sv

vsim tb_memory

do wave_tb_memory.tcl

log -r *

run -all


view wave
wave zoomfull