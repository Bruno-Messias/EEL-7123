transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/bruno/OneDrive - UFSC/GitHub/EEL-7123/Lab1_2/fulladder.vhd}
vcom -93 -work work {C:/Users/bruno/OneDrive - UFSC/GitHub/EEL-7123/Lab1_2/adder_8bits.vhd}
vcom -93 -work work {C:/Users/bruno/OneDrive - UFSC/GitHub/EEL-7123/Lab1_2/mult3.vhd}
vcom -93 -work work {C:/Users/bruno/OneDrive - UFSC/GitHub/EEL-7123/Lab1_2/usertop.vhd}

