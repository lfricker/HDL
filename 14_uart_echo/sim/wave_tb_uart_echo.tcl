onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_uart_echo/rst_n
add wave -noupdate /tb_uart_echo/clk
add wave -noupdate /tb_uart_echo/rx
add wave -noupdate /tb_uart_echo/tx
add wave -noupdate -radix ascii /tb_uart_echo/dut/u0_uart/rx_fifo/d_out
add wave -noupdate -radix ascii /tb_uart_echo/dut/u0_uart/u0_uart_rx/rx_data
add wave -noupdate -radix ascii /tb_uart_echo/dut/u0_uart/tx_fifo/d_out
add wave -noupdate /tb_uart_echo/dut/u0_uart/rx_fifo/r_en
add wave -noupdate /tb_uart_echo/dut/u0_uart/rx_fifo/w_en
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {415551108 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 284
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
