*CONDUCTION PMOS W1

.INCLUDE 22nm_MGK.pm
.OPTIONS GMIN=1e-020 ABSTOL=1e-18

*Definizione dei parametri
.PARAM Lmin=22n
.PARAM Wmin=22n
.PARAM Ldiff=44n
.PARAM VDD=0.8
	
*Descrizione della cella
Mp drain gate source body pmos W={3*Wmin} L={Lmin} AS={Wmin*Ldiff} AD={Wmin*Ldiff} PS={2*(Ldiff+Wmin)} PD={2*(Ldiff+Wmin)}
Vd 	drain	alim		0
Vg 	gate	0		{VDD}
Vs 	source	lima		0
Vb 	body	0		{VDD}
Vdd 	alim	0		0
Vss   lima  0   0

*Definizione del tipo di analisi
.CONTROL
let v1=0
let Vddbasic=0.80001

* set wr_vecnames
set wr_singlescale
set appendwrite

while v1 le Vddbasic
  alter Vdd = v1
  let v2=0
  while v2 le Vddbasic
    alter Vss = v2
    dc TEMP 25 50 26
    print V(drain) V(gate) V(source) V(body) I(Vd) I(Vg) I(Vs) I(Vb)
    wrdata pmos_off_3W.txt V(drain) V(gate) V(source) V(body) I(Vd) I(Vg) I(Vs) I(Vb)
    let v2 = v2 + 0.05
  end
  let v1 = v1 + 0.05
end

.ENDC
.END
