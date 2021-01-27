vlib work
vmap work work


vlog ../src/uart_rx.sv

vlog tb_uart_rx.sv


vsim tb_uart_rx

do wave_sim_uart_rx.tcl

log -r *

run -all


view wave
wave zoomfull