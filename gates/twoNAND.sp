.INCLUDE 22nm_MGK.pm
.OPTIONS GMIN=1e-020 ABSTOL=1e-18

*Definizione dei parametri
.PARAM Lmin=22n
.PARAM Wmin=22n
.PARAM Ldiff=44n
.PARAM VDD=0.8
.global gnd vdd


.subckt twoNAND x y out
M1 vdd x out vdd pmos W={2*Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}
M2 vdd y out vdd pmos W={2*Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}

M3 out x w gnd nmos W={Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}
M4 w y gnd gnd nmos W={Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}

.ends

.end
