onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_uart_tx/dut/rst_n
add wave -noupdate /tb_uart_tx/dut/clk
add wave -noupdate /tb_uart_tx/dut/tx_data
add wave -noupdate /tb_uart_tx/dut/tx_start
add wave -noupdate -color Blue /tb_uart_tx/dut/tx
add wave -noupdate -color Blue /tb_uart_tx/dut/idle
add wave -noupdate -color Magenta -format Analog-Step -height 74 -max 433.0 -radix unsigned /tb_uart_tx/dut/widthCnt
add wave -noupdate -color Magenta /tb_uart_tx/dut/widthCnt_load
add wave -noupdate -color Magenta /tb_uart_tx/dut/widthCnt_zero
add wave -noupdate -color {Medium Slate Blue} -format Analog-Step -height 74 -max 7.0 -radix unsigned /tb_uart_tx/dut/bitCnt
add wave -noupdate -color {Medium Slate Blue} /tb_uart_tx/dut/bitCnt_inc
add wave -noupdate -color {Medium Slate Blue} /tb_uart_tx/dut/bitCnt_clear
add wave -noupdate -color {Orange Red} /tb_uart_tx/dut/state
add wave -noupdate -color {Orange Red} /tb_uart_tx/dut/state_next
add wave -noupdate /tb_uart_tx/dut/WIDTHCNT_LOAD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {43530000 ps} 0} {{Cursor 2} {34850000 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 243
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
WaveRestoreZoom {0 ps} {375406500 ps}
