.PS # Pic input begins with .PS
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

dlabel(elen/2,elen*2/3,+,V_s,-,L)
dlabel(0,+elen/6,,L_s,,L)

setdir_(R)
line elen/2 from T.S1;dot
line elen/2 from T.S2;dot
line from T.P2 to AC.start
.PE 