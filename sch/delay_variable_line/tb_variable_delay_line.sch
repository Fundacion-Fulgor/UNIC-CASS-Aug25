v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 1000 -560 1000 -40 {}
L 4 1000 -40 1960 -40 {}
L 4 1960 -580 1960 -40 {}
L 4 1000 -580 1960 -580 {}
L 4 1000 -580 1000 -560 {}
N 1070 -260 1070 -220 {
lab=GND}
N 1170 -330 1170 -320 {
lab=vin1}
N 1210 -330 1250 -330 {
lab=vin1}
N 1350 -480 1350 -450 {lab=GND}
N 1350 -480 1380 -480 {lab=GND}
N 1876.25 -230 1876.25 -216.25 {lab=GND}
N 1876.25 -330 1876.25 -315 {lab=vout}
N 1350 -350 1350 -330 {lab=vgate}
N 1310 -330 1350 -330 {
lab=vgate}
N 1210 -350 1210 -330 {lab=vin1}
N 1170 -330 1210 -330 {
lab=vin1}
N 1569.375 -130.3125 1569.375 -110.3125 {lab=GND}
N 1876.25 -355 1876.25 -330 {lab=vout}
N 1569.375 -220.3125 1569.375 -190.3125 {lab=vc}
N 1823.75 -250 1823.75 -230 {lab=GND}
N 1823.75 -230 1876.25 -230 {lab=GND}
N 1876.25 -256.25 1876.25 -230 {lab=GND}
N 1823.75 -330 1823.75 -310 {lab=vout}
N 1170 -260 1170 -220 {lab=GND}
N 1070 -330 1170 -330 {lab=vin1}
N 1070 -330 1070 -320 {lab=vin1}
N 1689.375 -130.3125 1689.375 -110.3125 {lab=GND}
N 1569.375 -220.3125 1689.375 -220.3125 {lab=vc}
N 1480.625 -480 1480.625 -380 {lab=#net1}
N 1479.375 -280 1479.375 -271.25 {lab=GND}
N 1569.375 -280 1569.375 -220.3125 {lab=vc}
N 1440 -480 1480.625 -480 {lab=#net1}
N 1689.375 -220.3125 1689.375 -190.3125 {lab=vc}
N 1689.375 -230.625 1689.375 -220.3125 {lab=vc}
N 1350 -330 1440 -330 {lab=vgate}
N 1823.75 -330 1876.25 -330 {lab=vout}
N 1700 -330 1823.75 -330 {lab=vout}
C {/foss/designs/DLL/variable_delay_line.sym} 1569.375 -328.75 0 0 {name=x1}
C {devices/res.sym} 1280 -330 1 0 {name=R1
value=0k
footprint=1206
device=resistor
m=1
}
C {devices/gnd.sym} 1070 -220 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 1070 -290 0 0 {name=V1 value=1 savecurrent=false
spice_ignore=true}
C {devices/lab_pin.sym} 1210 -350 1 0 {name=p1 sig_type=std_logic lab=vin1}
C {devices/lab_pin.sym} 1350 -350 1 0 {name=p2 sig_type=std_logic lab=vgate}
C {devices/vsource.sym} 1410 -480 1 0 {name=Vdd1 value=1.2}
C {devices/code_shown.sym} 1005 -675 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {devices/gnd.sym} 1479.375 -271.25 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 1350 -450 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 1876.25 -217.5 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1569.375 -110.3125 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 1569.375 -160.3125 0 0 {name=Vdd2 value=0.4
}
C {devices/lab_pin.sym} 1689.375 -230.3125 1 0 {name=p3 sig_type=std_logic lab=vc}
C {devices/lab_pin.sym} 1876.25 -355 1 0 {name=p4 sig_type=std_logic lab=vout}
C {devices/vsource.sym} 1876.25 -285 0 0 {name=Vdd3 value=0
spice_ignore=true}
C {devices/capa.sym} 1823.75 -280 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"
}
C {devices/launcher.sym} 1158.75 -488.75 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/gnd.sym} 1170 -220 0 0 {name=l5 lab=GND}
C {devices/vsource.sym} 1689.375 -160.3125 0 0 {name=Vdd4 value=0
spice_ignore=true}
C {devices/gnd.sym} 1689.375 -110.3125 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} 1170 -290 0 0 {name=VIN1 value="PULSE(0 1.2 0 1p 1p 1n 2n)"}
C {devices/code_shown.sym} 2015 -565 0 0 {name=s1 only_toplevel=false 
value="
.save v(vin) v(vgate) v(vout) v(va)



.tran 2p 5n
.save all
*.ic v(vout) = 0
.control
run
plot v(vin1) v(vout) 

*plot v(vgate) 
*plot v(vout)
*meas tran teval WHEN v(vout) = 0.63
*let res_val = 1000
*let cap_val = teval/res_val
*print cap_val
.endc
"}
