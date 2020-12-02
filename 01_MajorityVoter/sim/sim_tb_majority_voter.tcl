# Init simulation environment
vlib work
vmap work work

#compile source files
#vlog for verilog and sv
#vcom for vhdl
vlog ../src/majority_voter.sv

#compile TB
vlog tb_majority_voter.sv

# set the simulation mdoule
vsim tb_majority_voter

#set signales to store
log -r *

run -all

view wave
wave zoomfull

do wave_tb_majority_voter.tcl