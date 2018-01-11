.PS
cct_init # Read in macro definitions and set defaults
elen = 0.75 # Variables are allowed; default units are inches
Origin: Here # Position names are capitalized

ground
setdir_(U)
series_(
	source(up elen/2,V);rlabel(,v_{zo})
	resistor(up elen/2);rlabel(,r_z)
)
{
	setdir_(L)
	line left elen/2
	resistor(left elen);rlabel(,R_1,);dot
	move left 0.2;"$+$"
	move right 0.2
	move down elen/2
	move left 0.2
	"$V_{C1}$"
	move right 0.2
	move down elen/2
	dot
	move left 0.2;"$-$"
	move right 0.2
	ground
}

.PE