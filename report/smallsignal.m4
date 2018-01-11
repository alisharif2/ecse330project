.PS
cct_init
elen = 0.75

Origin: Here
{
	setdir_(D)
	parallel_(
		resistor(down elen);rlabel(,r_o);llabel(+,v_{ds},-),
		series_(
			consource(down elen,I);rlabel(,g_m v_g),
			line left elen/2;dot,
			move left 0.2,
			"$V_{sig}$",
			move right 0.2,
			line right elen/2;setdir_(R);b_current(0A,above_);setdir_(D),
			resistor(down elen);rlabel(,\frac{1}{g_m});llabel(+,v_{gs},-)
		)
	)
	resistor(down elen);rlabel(,R_S);llabel(+,v_s,-);ground
}
line right elen*2
{
	setdir_(D)
	parallel_(
		resistor(down elen);rlabel(,R_L);llabel(+,v_o,-),
		capacitor(down elen);rlabel(,C_L),
		resistor(down elen);rlabel(,R_D)
	);ground
}

.PE