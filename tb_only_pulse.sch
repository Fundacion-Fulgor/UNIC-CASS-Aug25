v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 791.25 -480 791.25 -450 {lab=VOUT}
N 791.25 -387.5 791.25 -347.5 {lab=GND}
N 57.5 -596.25 57.5 -571.25 {lab=VDD}
N 530 -480 590 -480 {lab=VIN}
N 791.25 -480 847.5 -480 {lab=VOUT}
N 670 -480 791.25 -480 {lab=VOUT}
N 171.25 -561.25 171.25 -546.25 {lab=VIN}
N 171.25 -486.25 171.25 -470 {lab=GND}
N 620 -440 620 -352.5 {lab=GND}
N 57.5 -510 57.5 -482.5 {lab=GND}
N 620 -597.5 620 -520 {lab=#net1}
N 545 -598.75 560 -598.75 {lab=GND}
C {devices/vsource.sym} 57.5 -540 0 0 {name=VDD value=1.2}
C {devices/gnd.sym} 57.5 -482.5 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 57.5 -596.25 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/launcher.sym} 100 -831.25 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic_not.raw tran"
}
C {devices/launcher.sym} 101.25 -775 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/capa.sym} 791.25 -418.75 0 0 {name=C1
m=1
value=1f
footprint=1206
device="ceramic capacitor"
}
C {devices/lab_pin.sym} 530 -480 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {devices/code_shown.sym} 512.5 -1066.25 0 0 {name=CODE only_toplevel=false value="
.option scale=1e-12
.save v(vin) v(vout) 
.control
tran 5p 5n
plot v(vin) v(vout) 
plot v(vin) v(vout)+2
.endc

*.measure tran tdelay
*+ TRIG tran1.V(VIN) TD=0u VAL=0.6 RISE=1
*+ TARG tran1.V(VOUT) TD=0u VAL=0.6 RISE=1


"}
C {devices/vsource.sym} 171.25 -516.25 0 0 {name=VIN value="dc 0 ac 0 pulse(0, 1.2, 0, 1p, 1p, 250p, 500p ) "}
C {devices/lab_pin.sym} 171.25 -561.25 0 0 {name=p1 sig_type=std_logic lab=VIN}
C {devices/code_shown.sym} 15 -405 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif

"}
C {devices/lab_pin.sym} 847.5 -480 2 0 {name=p8 sig_type=std_logic lab=VOUT}
C {devices/gnd.sym} 620 -352.5 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 791.25 -348.75 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} 171.25 -470 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 590 -598.75 1 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} 545 -598.75 0 0 {name=l4 lab=GND}
