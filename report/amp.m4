.PS
cct_init
elen = 0.75

setdir_(U)
M1: e_fet(up) with .G at Here

resistor(up elen from M1.D);rlabel(,R_D);arrow up elen/4;move right 0.2;"$V_{dd}$"
RS: resistor(down elen from M1.S);rlabel(,R_S)
{
	move to M1.S;dot;line right elen/1.5
	capacitor(down elen);rlabel(,C_S)
	line left to RS.end;dot
}
ground

# bias resistors
move to M1.G;dot
resistor(up elen from M1.G);llabel(,R_a);arrow up elen/4;move left 0.2;"$V_{dd}$"
resistor(down elen from M1.G);llabel(,R_b);ground
capacitor(left elen from M1.G);dlabel(0,0.2,C_3)
source(down elen/2,AC);llabel(,V_{sig});ground

move to M1.D;dot; line right elen;dot;move right 0.2;"$V_{out}$"

.PE