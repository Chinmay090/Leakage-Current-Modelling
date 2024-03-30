.INCLUDE 22nm_MGK.pm
.OPTIONS GMIN=1e-020 ABSTOL=1e-18

.INCLUDE twoNAND.sp
.INCLUDE twoNOR.sp
.INCLUDE NOT.sp
.INCLUDE twoAND.sp
.INCLUDE twoOR.sp

*Definizione dei parametri
.PARAM Lmin=22n
.PARAM Wmin=22n
.PARAM Ldiff=44n
.global gnd vdd

Vdd vdd gnd {VDD}

x_NAND1 x y out twoNAND
* x_NOR1 x y out twoNOR
* x_NOT1 in out NOT
* x_AND1 x y out twoAND
* x_OR1 x y out twoOR

Vin1 x 0 0
Vin2 y 0 0
* Vin in 0 {VDD}

.CONTROL
dc TEMP 25 50 26
print V(x) V(y) V(out) I(Vdd) I(Vin1) I(Vin2)
* print V(in) V(out) I(Vdd) I(Vin)
.ENDC