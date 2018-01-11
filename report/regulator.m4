.PS
cct_init # Read in macro definitions and set defaults
elen = 0.75 # Variables are allowed; default units are inches
Origin: Here # Position names are capitalized

ground
DZ: diode(up elen,Z);dlabel(elen/2, -elen/1.5,-,V_{dd},+)
{setdir_(U);llabel(,D5,)}
dlabel(elen/2, elen*1.7,-,V_{C1},+)

{
	setdir_(L)
	line left elen/2
	resistor(left elen);rlabel(,R_1,);dot
	move down elen
	dot;ground
}
{line right elen/2;dot}
line right elen/2 from DZ.start;dot

.PE