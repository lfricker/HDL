onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_memory/u0_memory/clk
add wave -noupdate /tb_memory/u0_memory/addr
add wave -noupdate /tb_memory/u0_memory/we
add wave -noupdate /tb_memory/u0_memory/data_in
add wave -noupdate /tb_memory/u0_memory/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {314414 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 206
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
WaveRestoreZoom {0 ps} {2026500 ps}
