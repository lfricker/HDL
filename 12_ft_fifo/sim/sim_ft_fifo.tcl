vlib work
vmap work work


vlog ../src/ft_fifo.sv

vlog tb_ft_fifo.sv


vsim tb_ft_fifo

do wave_sim_ft_fifo.tcl

log -r *

run -all


view wave
wave zoomfull