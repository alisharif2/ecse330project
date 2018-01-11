.PS # Pic input begins with .PS
# Rectifier and Filter
cct_init # Read in macro definitions and set defaults
elen = 0.75 # Variables are allowed; default units are inches
Origin: Here # Position names are capitalized
dot
D1: diode(down elen/2)
{
	line right elen
	setdir_(D)
	capacitor(down elen/1.5);rlabel(,C_1,);dlabel(elen/3,elen/6,+,V_{C1},-,L);ground
}
dot;dlabel(elen/2,-elen/6,-,V_s,)
move down elen/2
D2: diode(up elen/2)
move down elen
D3: diode(up elen/2);dot
move down elen/2;dot;dlabel(elen/2,elen/6,-,V_s,+)
{
	line right elen/4;ground
}
D4: diode(down elen/2);dot
.PE