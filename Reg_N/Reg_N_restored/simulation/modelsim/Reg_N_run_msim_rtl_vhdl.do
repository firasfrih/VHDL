transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/firas/Desktop/Programmierbare Logik/4.1.1/Reg_N_restored/Reg_N.vhd}
vcom -93 -work work {C:/Users/firas/Desktop/Programmierbare Logik/4.1.1/Reg_N_restored/DFlipFlop.vhd}

