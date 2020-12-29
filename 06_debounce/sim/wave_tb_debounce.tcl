onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_debounce/dut/clk50m
add wave -noupdate /tb_debounce/dut/sw
add wave -noupdate -color {Dark Orchid} -format Analog-Step -height 74 -max 7.0 -radix unsigned /tb_debounce/dut/sw_hi_cnt
add wave -noupdate -color {Dark Orchid} /tb_debounce/dut/sw_hi_cnt_zero
add wave -noupdate -color {Dark Orchid} /tb_debounce/dut/sw_hi
add wave -noupdate -color Cyan -format Analog-Step -height 74 -max 7.0 -radix unsigned /tb_debounce/dut/sw_lo_cnt
add wave -noupdate -color Cyan /tb_debounce/dut/sw_lo_cnt_zero
add wave -noupdate -color Cyan /tb_debounce/dut/sw_lo
add wave -noupdate /tb_debounce/dut/sw_dbnc
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {395230 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 297
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
WaveRestoreZoom {0 ps} {1459500 ps}
