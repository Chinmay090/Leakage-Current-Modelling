.INCLUDE 22nm_MGK.pm
.OPTIONS GMIN=1e-020 ABSTOL=1e-18

.INCLUDE ./gates/twoNAND.sp
.INCLUDE ./gates/twoNOR.sp
.INCLUDE ./gates/NOT.sp
.INCLUDE ./gates/twoAND.sp
.INCLUDE ./gates/twoOR.sp

*Definizione dei parametri
.PARAM Lmin=22n
.PARAM Wmin=22n
.PARAM Ldiff=44n
.PARAM multiplier=1
.global gnd vdd

Vdd vdd gnd {VDD}

x_NOT1 Cn K1 NOT
x_AND1 P0 G0 K2 twoAND
x_AND2 G0 K1 K3 twoAND
x_NOR1 K2 K3 Cnx twoNOR

x_AND3 P1 G1 K4 twoAND
x_AND4 K2 G1 K5 twoAND
x_AND5 K3 G1 K6 twoAND
x_OR1 K4 K5 K7 twoOR
x_NOR2 K6 K7 Cny twoNOR

x_AND6 P2 G2 K8 twoAND
x_AND7 K4 G2 K9 twoAND
x_AND8 K5 G2 K10 twoAND
x_AND9 K6 G2 K11 twoAND
x_OR2 K8 K9 K12 twoOR
x_OR3 K10 K11 K13 twoOR
x_NOR3 K12 K13 Cnz twoNOR

x_AND10 P3 G3 K14 twoAND
x_AND11 K8 G3 K15 twoAND
x_AND12 K9 G3 K16 twoAND
x_AND13 G0 G1 K17 twoAND
x_AND14 G2 G3 K18 twoAND
x_AND15 K17 K18 K19 twoAND
x_OR4 K14 K15 K20 twoOR
x_OR5 K16 K19 K21 twoOR
x_OR6 K20 K21 G twoOR

x_OR7 P0 P1 K22 twoOR
x_OR8 P2 P3 K23 twoOR
x_OR9 K22 K23 P twoOR


VP0 P0 0 {VDD}
VP1 P1 0 {VDD}
VP2 P2 0 {VDD}
VP3 P3 0 {VDD}

VG0 G0 0 0
VG1 G1 0 0
VG2 G2 0 {VDD}
VG3 G3 0 {VDD}

VCn Cn 0 0

.CONTROL
dc TEMP 25 50 26
* print V(P0) V(P1) V(P2) V(P3) V(G0) V(G1) V(G2) V(G3) V(Cnx) V(Cny) V(Cnz) V(G) V(P)
print I(Vdd)
print I(VP0) I(VP1) I(VP2) I(VP3) I(VG0) I(VG1) I(VG2) I(VG3) I(VCn)
print (abs(I(VP0))+abs(I(VP1))+abs(I(VP2))+abs(I(VP3))+abs(I(VG0))+abs(I(VG1))+abs(I(VG2))+abs(I(VG3))+abs(I(VCn)))
.ENDC

.end