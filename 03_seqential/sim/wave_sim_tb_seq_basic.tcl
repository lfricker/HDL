onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_seq_basic/dut/rst_n
add wave -noupdate /tb_seq_basic/dut/clk
add wave -noupdate -color Goldenrod /tb_seq_basic/dut/d
add wave -noupdate -color Goldenrod /tb_seq_basic/dut/q
add wave -noupdate -color Cyan /tb_seq_basic/dut/regin
add wave -noupdate -color Cyan /tb_seq_basic/dut/regout
add wave -noupdate -color {Medium Violet Red} /tb_seq_basic/dut/srin
add wave -noupdate -color {Medium Violet Red} /tb_seq_basic/dut/sr
add wave -noupdate /tb_seq_basic/action
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {61431 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
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
WaveRestoreZoom {0 ps} {399 ns}
