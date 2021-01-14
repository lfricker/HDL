vlib work
vmap work work


vlog ../src/ds_dac.v

vlog tb_ds_dac.sv

vsim tb_ds_dac

do wave_tb_ds_dac.tcl

log -r *

run -all


view wave
wave zoomfull