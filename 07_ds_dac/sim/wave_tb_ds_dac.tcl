onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ds_dac/clk50m
add wave -noupdate /tb_ds_dac/clk_en
add wave -noupdate /tb_ds_dac/rst_n
add wave -noupdate -format Analog-Step -height 74 -max 65534.999999999993 -radix unsigned /tb_ds_dac/din
add wave -noupdate /tb_ds_dac/dout
add wave -noupdate -format Analog-Step -height 74 -max 65534.999999999993 /tb_ds_dac/mean
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1570293 ps} 0}
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
WaveRestoreZoom {0 ps} {84115500 ps}
