v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 720 -290 860 -290 {lab=VOUT}
N 860 -290 860 -260 {lab=VOUT}
N 860 -200 860 -160 {lab=VSS}
N 110 -290 420 -290 {lab=VIN}
N 110 -140 160 -140 {lab=VIN}
N 110 -290 110 -140 {lab=VIN}
N 80 -290 110 -290 {lab=VIN}
N 110 -110 160 -110 {lab=VOUT}
N 110 -110 110 -50 {lab=VOUT}
N 110 -50 720 -50 {lab=VOUT}
N 720 -290 720 -50 {lab=VOUT}
N 320 -110 390 -110 {lab=#net1}
N 320 -140 390 -140 {lab=#net2}
N 510 -130 550 -130 {lab=#net3}
N 680 -290 720 -290 {lab=VOUT}
N 550 -237.5 550 -130 {lab=#net3}
C {devices/vsource.sym} -320 -160 0 0 {name=VDD value=1.2}
C {devices/vsource.sym} -220 -160 0 0 {name=VSS1 value=0}
C {devices/gnd.sym} -220 -130 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} -320 -130 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -320 -270 0 0 {name=VIN1 value="PULSE(0 1.2 0 0.1p 0.1p 250p 500p)"}
C {devices/lab_pin.sym} -320 -300 0 0 {name=p11 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} -320 -240 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -220 -190 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -320 -190 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/code_shown.sym} 510 20 0 0 {name=CODE only_toplevel=false value="
.option scale=1e-6
.save v(vin) v(vout) 
.control
tran 2n 6u
plot v(vin) v(vout) 
plot v(vin) v(vout)+2
.endc

.measure tran tdelay
+ TRIG tran1.V(VIN) TD=0u VAL=0.6 RISE=1
+ TARG tran1.V(VOUT) TD=0u VAL=0.6 RISE=1


"}
C {devices/code_shown.sym} -350 10 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif

.include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {/foss/designs/DLL/variable_delay_line.sym} 550 -290 0 0 {name=x1}
C {devices/lab_pin.sym} 860 -290 2 0 {name=p8 sig_type=std_logic lab=VOUT}
C {devices/capa.sym} 860 -230 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 860 -160 2 0 {name=p14 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 80 -290 0 0 {name=p1 sig_type=std_logic lab=VIN}
C {/foss/designs/DLL/phase_detector.sym} 240 -130 0 0 {name=x2}
C {/foss/designs/DLL/push_pull.sym} 490 -130 0 0 {name=x3}
