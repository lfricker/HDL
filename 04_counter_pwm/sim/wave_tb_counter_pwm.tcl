onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_counter_pwm/dut/rst_n
add wave -noupdate /tb_counter_pwm/dut/clk50m
add wave -noupdate /tb_counter_pwm/dut/en
add wave -noupdate /tb_counter_pwm/dut/down
add wave -noupdate -radix unsigned /tb_counter_pwm/dut/cmp
add wave -noupdate -radix unsigned /tb_counter_pwm/dut/per
add wave -noupdate -format Analog-Step -height 74 -max 30.999999999999996 -radix unsigned /tb_counter_pwm/dut/cnt
add wave -noupdate /tb_counter_pwm/dut/pwm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7702670 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 194
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
configure wave -timelineunits ps
update
WaveRestoreZoom {7596492 ps} {7859574 ps}
