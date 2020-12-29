vlib work
vmap work work


vlog ../src/debounce.sv

vlog tb_debounce.sv

vsim tb_debounce

do wave_tb_debounce.tcl

log -r *

run -all


view wave
wave zoomfull