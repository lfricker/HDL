vlib work
vmap work work


vlog ../src/*.sv

#vlog tb_uart_with_buffer_echo1.sv
vlog tb_uart_with_buffer_echo2.sv


vsim tb_uart_with_buffer

do wave_tb_uart_with_buffer.tcl

log -r *

run -all


view wave
wave zoomfull