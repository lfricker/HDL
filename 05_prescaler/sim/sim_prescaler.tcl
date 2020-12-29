vlib work
vmap work work


vlog ../src/prescaler.sv

vlog tb_prescaler.sv


vsim tb_prescaler

do wave_tb_prescaler.tcl

log -r *

run -all


view wave
wave zoomfull