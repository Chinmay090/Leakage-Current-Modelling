*CONDUCTION NMOS W1

.INCLUDE 22nm_MGK.pm
.OPTIONS GMIN=1e-020 ABSTOL=1e-18

*Definizione dei parametri
.PARAM Lmin=22n
.PARAM Wmin=22n
.PARAM Ldiff=44n
.PARAM VDD=0.8
.PARAM multiplier=8
	
*Descrizione della cella
Mp1 drain in1 int body pmos W={multiplier*Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}
Mp2 int in2 out body pmos W={multiplier*Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}

Vin1 in1 0 0
Vin2 in2 0 0
Vd drain 0 {VDD}
Vout out 0 {VDD}
Vbody body 0 {VDD}
Vdd {VDD} 0 0 

*Definizione del tipo di analisi
.CONTROL

* set wr_vecnames
set wr_singlescale
set appendwrite

dc TEMP 25 25 1

print V(in1) V(in2) V(int) V(out) V(drain) V(body)
wrdata pmos_stack_00.txt V(in1) V(in2) V(int) V(out) V(drain) V(body)

.ENDC
.END
