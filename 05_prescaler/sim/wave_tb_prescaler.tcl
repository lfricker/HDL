onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_prescaler/rst_n
add wave -noupdate /tb_prescaler/clk50m
add wave -noupdate /tb_prescaler/run_sim
add wave -noupdate /tb_prescaler/dut1/w
add wave -noupdate -color Turquoise /tb_prescaler/en_1
add wave -noupdate -color Turquoise -format Analog-Step -height 74 -max 49.0 -radix unsigned /tb_prescaler/dut1/cnt
add wave -noupdate /tb_prescaler/dut2/w
add wave -noupdate -color {Blue Violet} /tb_prescaler/en_2
add wave -noupdate -color {Blue Violet} -format Analog-Step -height 74 -max 99.0 -radix unsigned /tb_prescaler/dut2/cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2070000 ps} 0} {{Cursor 2} {4070000 ps} 0}
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
WaveRestoreZoom {0 ps} {10594500 ps}
