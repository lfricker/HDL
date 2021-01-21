vlib work
vmap work work


vlog ../src/uart_tx.sv

vlog tb_uart_tx.sv


vsim tb_uart_tx

do wave_tb_uart_tx.tcl

log -r *

run -all


view wave
wave zoomfull