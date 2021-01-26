onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Violet Red} /tb_Toplevel_C5G_GPIO/dut/key_slower/sw
add wave -noupdate -color {Violet Red} /tb_Toplevel_C5G_GPIO/dut/key_slower/sw_hi
add wave -noupdate -color {Violet Red} /tb_Toplevel_C5G_GPIO/dut/key_faster/sw_hi
add wave -noupdate -color {Violet Red} /tb_Toplevel_C5G_GPIO/dut/counter_updn_8bit/en
add wave -noupdate -color {Violet Red} -max 254.0 -radix unsigned /tb_Toplevel_C5G_GPIO/dut/speed
add wave -noupdate -color {Medium Violet Red} -radix unsigned /tb_Toplevel_C5G_GPIO/dut/HEX0
add wave -noupdate -color {Medium Violet Red} -radix unsigned /tb_Toplevel_C5G_GPIO/dut/HEX1
add wave -noupdate /tb_Toplevel_C5G_GPIO/dut/inc_data
add wave -noupdate -format Analog-Step -height 74 -max 1024.0 -radix unsigned /tb_Toplevel_C5G_GPIO/dut/addr
add wave -noupdate -format Analog-Step -height 200 -max 65600.0 -radix unsigned /tb_Toplevel_C5G_GPIO/dut/signal
add wave -noupdate /tb_Toplevel_C5G_GPIO/dut/ds_dac_out
add wave -noupdate /tb_Toplevel_C5G_GPIO/dut/pwm_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1659090000 ps} 0} {{Cursor 2} {61900258998 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 311
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
WaveRestoreZoom {0 ps} {84257355 ns}
