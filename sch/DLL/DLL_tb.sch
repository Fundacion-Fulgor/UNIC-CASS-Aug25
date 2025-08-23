v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 310 -1280 370 -1280 {
lab=GND}
N 430 -1280 470 -1280 {lab=VDD}
N 60 -1060 60 -1020 {
lab=GND}
N 160 -1130 160 -1120 {
lab=#net1}
N 1022.5 -1030 1022.5 -1016.25 {lab=GND}
N 1022.5 -1130 1022.5 -1115 {lab=vin2}
N 340 -1130 410 -1130 {
lab=#net1}
N 490 -1080 490 -1020 {lab=vc}
N 970 -1050 970 -1030 {lab=GND}
N 970 -1030 1022.5 -1030 {lab=GND}
N 1022.5 -1056.25 1022.5 -1030 {lab=GND}
N 970 -1130 970 -1110 {lab=vin2}
N 808.75 -1280 808.75 -1170 {lab=VDD}
N 930 -1130 970 -1130 {lab=vin2}
N 582.5 -1195 582.5 -1130 {lab=va}
N 450 -1080 450 -1055 {lab=GND}
N 160 -1060 160 -1020 {lab=GND}
N 60 -1130 160 -1130 {lab=#net1}
N 60 -1130 60 -1120 {lab=#net1}
N 582.5 -1130 630 -1130 {lab=va}
N 470 -1280 808.75 -1280 {lab=VDD}
N 490 -1020 610 -1020 {lab=vc}
N 625 -550 1120 -550 {lab=vin2}
N 1120 -1130 1120 -550 {lab=vin2}
N 1022.5 -1130 1120 -1130 {lab=vin2}
N 970 -1130 1022.5 -1130 {lab=vin2}
N 377.5 -550 480 -550 {lab=#net1}
N 470 -1280 470 -1180 {lab=VDD}
N 530 -1130 582.5 -1130 {lab=va}
N 135 -777.5 135 -717.5 {
lab=GND}
N 135 -877.5 135 -837.5 {lab=VSS}
N 625 -550 625 -502.5 {lab=vin2}
N 510 -550 625 -550 {lab=vin2}
N 377.5 -550 377.5 -512.5 {lab=#net1}
N 340 -550 377.5 -550 {lab=#net1}
N 462.5 -777.5 480 -777.5 {lab=vup}
N 510 -777.5 546.25 -777.5 {lab=vdn}
N 340 -1130 340 -550 {lab=#net1}
N 160 -1130 340 -1130 {
lab=#net1}
N 490 -1020 490 -985 {lab=vc}
N 480 -597.5 480 -550 {lab=#net1}
N 510 -598.75 510 -550 {lab=vin2}
N 480 -777.5 480 -758.75 {lab=vup}
N 480 -863.75 480 -777.5 {lab=vup}
N 510 -777.5 510 -757.5 {lab=vdn}
N 510 -863.75 510 -777.5 {lab=vdn}
C {devices/code_shown.sym} 1215 -1077.5 0 0 {name=s1 only_toplevel=false 
value="
.save v(vin1) v(vin2)  v(vc) v(vdn) v(vup)



.tran 10p 10n
.save all
*.ic v(vout) = 0
.control
run
plot v(vin1) v(vin2)
plot v(vc)
plot v(vup) v(vdn)


*plot v(vin2) 

*plot v(vout)
*meas tran teval WHEN v(vout) = 0.63
*let res_val = 1000
*let cap_val = teval/res_val
*print cap_val
.endc
"}
C {devices/code_shown.sym} 205 -1437.5 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {devices/vsource.sym} 400 -1280 1 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} 310 -1280 1 0 {name=Vdd2 lab=GND
value=1.2}
C {devices/lab_pin.sym} 470 -1280 1 0 {name=Vdd3 sig_type=std_logic lab=VDD
value=1.2}
C {/foss/designs/UNIC-CASS-Aug25/sym/delay_variable/delay_variable.sym} 470 -1130 0 0 {name=x1
}
C {devices/gnd.sym} 60 -1020 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 60 -1090 0 0 {name=V1 value=1 savecurrent=false
spice_ignore=true}
C {devices/gnd.sym} 450 -1055 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 1022.5 -1017.5 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 610 -1020 1 0 {name=p4 sig_type=std_logic lab=vc}
C {devices/vsource.sym} 1022.5 -1085 0 0 {name=Vdd6 value=0
spice_ignore=true}
C {devices/capa.sym} 970 -1080 0 0 {name=C4
m=1
value=100f
footprint=1206
device="ceramic capacitor"
}
C {devices/launcher.sym} 798.125 -938.75 0 0 {name=h1
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} 160 -1090 0 0 {name=VIN3 value="PULSE(0 1.2 0 5p 5p 1n 2n)"}
C {devices/gnd.sym} 160 -1020 0 0 {name=l7 lab=GND}
C {/foss/designs/UNIC-CASS-Aug25/sym/large_delay_vto1p1/large_delay_vto1p1.sym} 750 -1130 0 0 {name=x9}
C {devices/gnd.sym} 810 -1090 0 0 {name=l12 lab=GND}
C {devices/lab_pin.sym} 582.5 -1195 1 0 {name=p10 sig_type=std_logic lab=va}
C {devices/vsource.sym} 135 -807.5 0 0 {name=Vss1 value=0}
C {devices/gnd.sym} 135 -717.5 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 135 -877.5 0 0 {name=p26 sig_type=std_logic lab=VSS}
C {/foss/designs/UNIC-CASS-Aug25/sym/phase_detector/phase_detector.sym} 490 -677.5 3 0 {name=x2
}
C {devices/lab_pin.sym} 462.5 -777.5 0 0 {name=p7 sig_type=std_logic lab=vup}
C {devices/lab_pin.sym} 546.25 -777.5 2 0 {name=p8 sig_type=std_logic lab=vdn}
C {devices/lab_pin.sym} 377.5 -511.25 0 0 {name=p6 sig_type=std_logic lab=vin1}
C {devices/lab_pin.sym} 625 -503.75 2 0 {name=p9 sig_type=std_logic lab=vin2}
C {/foss/designs/UNIC-CASS-Aug25/sym/push_pull/push_pull.sym} 490 -963.75 3 0 {name=x3 
}
