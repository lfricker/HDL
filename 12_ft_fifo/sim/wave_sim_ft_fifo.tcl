onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ft_fifo/dut/rst_n
add wave -noupdate /tb_ft_fifo/dut/clk
add wave -noupdate -radix ascii /tb_ft_fifo/dut/data
add wave -noupdate -radix unsigned /tb_ft_fifo/dut/d_cnt
add wave -noupdate -color {Blue Violet} -itemcolor {Dark Orchid} -radix ascii /tb_ft_fifo/dut/d_in
add wave -noupdate -color {Blue Violet} -itemcolor {Dark Orchid} -radix ascii /tb_ft_fifo/dut/d_out
add wave -noupdate -color {Blue Violet} -itemcolor {Dark Orchid} /tb_ft_fifo/dut/w_en
add wave -noupdate -color {Blue Violet} -itemcolor {Dark Orchid} /tb_ft_fifo/dut/r_en
add wave -noupdate /tb_ft_fifo/dut/full
add wave -noupdate /tb_ft_fifo/dut/empty
add wave -noupdate /tb_ft_fifo/action
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25495056 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {0 ps} {777 ns}
