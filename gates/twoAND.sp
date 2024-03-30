.INCLUDE 22nm_MGK.pm
.OPTIONS GMIN=1e-020 ABSTOL=1e-18
.INCLUDE twoNAND.sp
.INCLUDE NOT.sp

*Definizione dei parametri
.PARAM Lmin=22n
.PARAM Wmin=22n
.PARAM Ldiff=44n
.PARAM VDD=0.8
.PARAM multiplier=1
.global gnd vdd


.subckt twoAND x y out
x_NAND1 x y k twoNAND
x_NOT1 k out NOT
.ends

.end
