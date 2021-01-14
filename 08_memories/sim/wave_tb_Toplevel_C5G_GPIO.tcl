onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_Toplevel_C5G_GPIO/clk50m
add wave -noupdate /tb_Toplevel_C5G_GPIO/rst_n
add wave -noupdate -radix unsigned /tb_Toplevel_C5G_GPIO/dut/LEDR
add wave -noupdate -radix unsigned /tb_Toplevel_C5G_GPIO/dut/HEX0
add wave -noupdate -radix unsigned /tb_Toplevel_C5G_GPIO/dut/HEX1
add wave -noupdate /tb_Toplevel_C5G_GPIO/dut/en_1m
add wave -noupdate -format Analog-Step -height 74 -max 29.999999999999996 -radix unsigned /tb_Toplevel_C5G_GPIO/dut/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {23515210 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 287
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
WaveRestoreZoom {0 ps} {42199500 ps}
