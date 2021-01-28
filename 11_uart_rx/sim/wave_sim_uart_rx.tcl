onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_uart_rx/dut/rst_n
add wave -noupdate /tb_uart_rx/dut/clk
add wave -noupdate /tb_uart_rx/dut/rx
add wave -noupdate -radix ascii /tb_uart_rx/dut/rx_data
add wave -noupdate /tb_uart_rx/dut/idle
add wave -noupdate /tb_uart_rx/dut/valid
add wave -noupdate -format Analog-Step -height 74 -max 433.0 -radix unsigned /tb_uart_rx/dut/widthCnt
add wave -noupdate /tb_uart_rx/dut/widthCnt_sample
add wave -noupdate -radix unsigned /tb_uart_rx/dut/bitCnt
add wave -noupdate /tb_uart_rx/dut/bitCnt_inc
add wave -noupdate /tb_uart_rx/dut/bitCnt_clear
add wave -noupdate /tb_uart_rx/dut/rx_buffer
add wave -noupdate /tb_uart_rx/dut/sample_rx
add wave -noupdate /tb_uart_rx/dut/state
add wave -noupdate /tb_uart_rx/dut/state_next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {219493841 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 220
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {209466448 ps} {234938576 ps}
