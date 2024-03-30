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
Mn1 out in1 int body nmos W={multiplier*Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}
Mn2 int in2 src body nmos W={multiplier*Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}

Vin1 in1 0 {VDD}
Vin2 in2 0 0
Vout out 0 {VDD}
Vsrc src 0 0
Vbody body 0 0
Vdd {VDD} 0 0 

*Definizione del tipo di analisi
.CONTROL

* set wr_vecnames
set wr_singlescale
set appendwrite

dc TEMP 25 25 1

print V(in1) V(in2) V(int) V(out) V(src) V(body)
wrdata nmos_stack_10.txt V(in1) V(in2) V(int) V(out) V(src) V(body)


.ENDC
.END
