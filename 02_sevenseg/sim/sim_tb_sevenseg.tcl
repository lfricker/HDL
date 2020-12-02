# -------------------------
# This file shall control the whole simulation
# - setup environment
# - compile sources
# - compile test benches
# - init simulation
# - run the simulation
# - show the output
# -------------------------

# (1) Setup sim environment
vlib work
vmap work work

# (2) Compile the sources
vlog ../src/sevenseg.sv
# Compile a file --> use the filename!!!

# (3) Compile TB
vlog    tb_sevenseg.sv

# (4) Initialize simulation
vsim    tb_sevenseg
# Use the module name!!!

do wave_tb_sevenseg.tcl
# all the signal listed in the wave file are logged
log -r *
# log all signals recursively (down the hierarchy)

# (5) Run the simulation
run -all

# (6) Bring up the wave window
view wave
wave zoomfull
