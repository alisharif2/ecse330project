.PS
cct_init # Read in macro definitions and set defaults
elen = 0.75 # Variables are allowed; default units are inches
Origin: Here # Position names are capitalized

ground
AC: source(up_ elen,AC); llabel(-,V_{sup},+)
Rsup: resistor(right_ elen); llabel(,R_{sup},)
line right elen/2
T: transformer(down elen) with .P1 at Here
setdir_(D)
dlabel(elen/2.5,-elen*2/3,+,V_p,-,R)
dlabel(0,-elen/6,,L_p,,R)

dlabel(elen/3,elen*0.5,+,V_s,-,L)
dlabel(0,+elen/6,,L_s,,L)

setdir_(R)
line elen/2 from T.S1;dot
line elen/2 from T.S2;dot
line from T.P2 to AC.start

L1: line right elen from T.S2
{
	move up elen/2; {line left elen/4;crossover(down elen/1.5,,L1);ground}
	diode(down elen/2)
	move up elen/2
	diode(up elen/2)
}

line right elen/2
diode(up elen/2)
{
	line right elen/3;line down elen*1.5;line left elen
	P1: Here
}
move up elen/2
D1: diode(down elen/2)
line left elen from D1.start 

move to P1
setdir_(D)
C1: capacitor(down elen/1.5);rlabel(,C_1,);llabel(+,V_{C1},-);ground
move to C1.start
resistor(left elen*1.5);setdir_(L);rlabel(,R_1,);setdir_(U)
{ capacitor(down elen/1.5);rlabel(,C_2);ground }
line left elen
move down elen
diode(up elen,Z);rlabel(,D5,);llabel(-,V_{dd},+)
move down elen
ground


.PE