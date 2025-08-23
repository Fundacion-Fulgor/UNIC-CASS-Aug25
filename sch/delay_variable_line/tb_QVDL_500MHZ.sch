v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
L 4 1360 -1000 1360 -480 {}
L 4 1360 -480 2460 -480 {}
L 4 2460 -1000 2460 -480 {}
L 4 1360 -1000 2460 -1000 {}
N 1420 -730 1420 -690 {
lab=GND}
N 1520 -800 1520 -790 {
lab=vin1}
N 1560 -800 1600 -800 {
lab=vin1}
N 1830 -950 1830 -850 {lab=#net1}
N 1790 -950 1830 -950 {lab=#net1}
N 1700 -950 1700 -920 {lab=GND}
N 1700 -950 1730 -950 {lab=GND}
N 2382.5 -700 2382.5 -686.25 {lab=GND}
N 2382.5 -800 2382.5 -785 {lab=vout}
N 1700 -820 1700 -800 {lab=vgate}
N 1660 -800 1700 -800 {
lab=vgate}
N 1560 -820 1560 -800 {lab=vin1}
N 1520 -800 1560 -800 {
lab=vin1}
N 1850 -600 1850 -580 {lab=GND}
N 2382.5 -825 2382.5 -800 {lab=vout}
N 2330 -800 2382.5 -800 {lab=vout}
N 1850 -750 1850 -690 {lab=vc}
N 2330 -720 2330 -700 {lab=GND}
N 2330 -700 2382.5 -700 {lab=GND}
N 2382.5 -726.25 2382.5 -700 {lab=GND}
N 2330 -800 2330 -780 {lab=vout}
N 2168.75 -950 2168.75 -840 {lab=#net1}
N 1700 -800 1770 -800 {lab=vgate}
N 2290 -800 2330 -800 {lab=vout}
N 1942.5 -865 1942.5 -800 {lab=va}
N 1850 -690 1850 -660 {lab=vc}
N 1810 -750 1810 -725 {lab=GND}
N 1520 -730 1520 -690 {lab=GND}
N 1420 -800 1520 -800 {lab=vin1}
N 1420 -800 1420 -790 {lab=vin1}
N 1942.5 -800 2002.5 -800 {lab=va}
N 1890 -800 1942.5 -800 {lab=va}
N 1830 -950 2168.75 -950 {lab=#net1}
N 1970 -600 1970 -580 {lab=GND}
N 1970 -690 1970 -660 {lab=vc}
N 1850 -690 1970 -690 {lab=vc}
C {/foss/designs/DLL/variable_delay.sym} 1830 -800 0 0 {name=x1
}
C {devices/res.sym} 1630 -800 1 0 {name=R1
value=0k
footprint=1206
device=resistor
m=1
}
C {devices/gnd.sym} 1420 -690 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 1420 -760 0 0 {name=V1 value=1 savecurrent=false
spice_ignore=true}
C {devices/code_shown.sym} 2525 -995 0 0 {name=s1 only_toplevel=false 
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
C {devices/lab_pin.sym} 1560 -820 1 0 {name=p1 sig_type=std_logic lab=vin1}
C {devices/lab_pin.sym} 1700 -820 1 0 {name=p2 sig_type=std_logic lab=vgate}
C {devices/vsource.sym} 1760 -950 1 0 {name=Vdd1 value=1.2}
C {devices/code_shown.sym} 1355 -1105 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {devices/gnd.sym} 1810 -725 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 1700 -920 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 2382.5 -687.5 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1850 -580 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 1850 -630 0 0 {name=Vdd2 value=0.4
}
C {devices/lab_pin.sym} 1970 -690 1 0 {name=p3 sig_type=std_logic lab=vc}
C {devices/lab_pin.sym} 2382.5 -825 1 0 {name=p4 sig_type=std_logic lab=vout}
C {devices/vsource.sym} 2382.5 -755 0 0 {name=Vdd3 value=0
spice_ignore=true}
C {devices/capa.sym} 2330 -750 0 0 {name=C1
m=1
value=100f
footprint=1206
device="ceramic capacitor"
}
C {devices/launcher.sym} 2156.25 -606.25 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} 1520 -760 0 0 {name=VIN1 value="PULSE(0 1.2 0 1p 1p 1n 2n)"}
C {devices/gnd.sym} 1520 -690 0 0 {name=l5 lab=GND}
C {/foss/designs/UCU/uniccass-icdesign-tools/shared_xserver/OS_AnalogIC_UCU_July2025/Day3/large_delay/large_delay_vto1p1.sym} 2110 -800 0 0 {name=x9}
C {devices/gnd.sym} 2170 -760 0 0 {name=l6 lab=GND}
C {devices/lab_pin.sym} 1942.5 -865 1 0 {name=p5 sig_type=std_logic lab=va}
C {devices/vsource.sym} 1970 -630 0 0 {name=Vdd4 value=0
spice_ignore=true}
C {devices/gnd.sym} 1970 -580 0 0 {name=l7 lab=GND}
