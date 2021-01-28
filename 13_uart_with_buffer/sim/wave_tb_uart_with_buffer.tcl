onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_uart_with_buffer/dut/rst_n
add wave -noupdate /tb_uart_with_buffer/dut/clk
add wave -noupdate -radix ascii /tb_uart_with_buffer/dut/tx_data
add wave -noupdate /tb_uart_with_buffer/dut/tx_en
add wave -noupdate -color {Dark Orchid} -radix ascii /tb_uart_with_buffer/dut/tx_fifo/d_in
add wave -noupdate -color {Dark Orchid} -radix ascii /tb_uart_with_buffer/dut/tx_fifo/d_out
add wave -noupdate -color {Dark Orchid} -radix unsigned /tb_uart_with_buffer/dut/tx_fifo/r_en
add wave -noupdate -color {Dark Orchid} -radix unsigned /tb_uart_with_buffer/dut/tx_fifo/w_en
add wave -noupdate -color {Dark Orchid} -radix unsigned /tb_uart_with_buffer/dut/tx_fifo/d_cnt
add wave -noupdate -color Green /tb_uart_with_buffer/dut/u0_uart_tx/tx_data
add wave -noupdate -color Green /tb_uart_with_buffer/dut/u0_uart_tx/tx_start
add wave -noupdate -color Green /tb_uart_with_buffer/dut/u0_uart_tx/tx
add wave -noupdate -color Green /tb_uart_with_buffer/dut/u0_uart_tx/state
add wave -noupdate -color {Dark Orchid} /tb_uart_with_buffer/dut/u0_uart_rx/idle
add wave -noupdate -color {Dark Orchid} /tb_uart_with_buffer/dut/u0_uart_rx/state
add wave -noupdate -color {Dark Orchid} -radix ascii /tb_uart_with_buffer/dut/u0_uart_rx/rx_data
add wave -noupdate -color {Dark Orchid} /tb_uart_with_buffer/dut/u0_uart_rx/valid
add wave -noupdate -radix ascii /tb_uart_with_buffer/dut/rx_data
add wave -noupdate -radix ascii /tb_uart_with_buffer/dut/rx_fifo/d_in
add wave -noupdate -radix hexadecimal /tb_uart_with_buffer/dut/rx_fifo/d_out
add wave -noupdate /tb_uart_with_buffer/dut/rx_empty
add wave -noupdate /tb_uart_with_buffer/dut/rx_fifo/w_en
add wave -noupdate /tb_uart_with_buffer/dut/rx_fifo/r_en
add wave -noupdate -radix unsigned /tb_uart_with_buffer/dut/rx_fifo/d_cnt
add wave -noupdate /tb_uart_with_buffer/action
add wave -noupdate -radix ascii /tb_uart_with_buffer/rx_data
add wave -noupdate /tb_uart_with_buffer/rx
add wave -noupdate /tb_uart_with_buffer/tx
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {57934952 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 279
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
WaveRestoreZoom {0 ps} {1104442500 ps}
