vlib work
vmap work work


vlog ../src/*.sv

vlog tb_uart_echo.sv


vsim tb_uart_echo

do wave_tb_uart_echo.tcl

log -r *

run -all


view wave
wave zoomfull