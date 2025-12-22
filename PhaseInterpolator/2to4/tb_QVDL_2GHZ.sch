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
B 2 1450 -1660 2520 -1180 {flags=graph
y1=-0.28386574
y2=1.6561343
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-1.5e-10
x2=2.85e-09
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="va
vin1"
color="4 10"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1}
B 2 3120 -1620 4190 -1140 {flags=graph
y1=-0.28386574
y2=1.6561343
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-1.5e-10
x2=2.85e-09
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vin1
Vout180"
color="4 10"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=1}
B 2 3120 -1020 4190 -540 {flags=graph
y1=-0.250964
y2=1.689036
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-1.5e-10
x2=2.85e-09
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout90
Vout270"
color="20 17"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1}
T {VCDL} 1380 -530 0 0 0.7 0.7 {}
N 1420 -730 1420 -690 {
lab=GND}
N 1520 -800 1520 -790 {
lab=vin1}
N 1830 -950 2168.75 -950 {lab=#net1}
N 1700 -950 1700 -920 {lab=GND}
N 1700 -950 1730 -950 {lab=GND}
N 2382.5 -700 2382.5 -686.25 {lab=GND}
N 2382.5 -800 2382.5 -785 {lab=vout90}
N 1560 -820 1560 -800 {lab=vin1}
N 1520 -800 1560 -800 {
lab=vin1}
N 2382.5 -825 2382.5 -800 {lab=vout90}
N 1850 -750 1850 -690 {lab=vc}
N 2330 -720 2330 -700 {lab=GND}
N 2382.5 -726.25 2382.5 -700 {lab=GND}
N 2168.75 -950 2168.75 -840 {lab=#net1}
N 1942.5 -865 1942.5 -800 {lab=va}
N 1810 -750 1810 -725 {lab=GND}
N 1520 -730 1520 -690 {lab=GND}
N 1420 -800 1520 -800 {lab=vin1}
N 1420 -800 1420 -790 {lab=vin1}
N 1970 -600 1970 -580 {lab=GND}
N 1970 -690 1970 -660 {lab=vc}
N 1850 -690 1970 -690 {lab=vc}
N 1970 -720 1970 -690 {lab=vc}
N 2330 -800 2330 -780 {lab=vout90}
N 2290 -800 2330 -800 {lab=vout90}
N 1830 -950 1830 -850 {lab=#net1}
N 1790 -950 1830 -950 {lab=#net1}
N 1640 -800 1770 -800 {
lab=vin1}
N 1942.5 -800 1990 -800 {lab=va}
N 1890 -800 1942.5 -800 {lab=va}
N 2170 -950 2550 -950 {lab=#net2}
N 2550 -950 2550 -840 {lab=#net2}
N 2690 -800 2690 -780 {lab=Vout270}
N 2690 -720 2690 -690 {lab=GND}
N 2330 -700 2382.5 -700 {lab=GND}
N 2550 -690 2690 -690 {lab=GND}
N 2550 -760 2550 -690 {lab=GND}
N 2382.5 -800 2420 -800 {lab=vout90}
N 2330 -800 2382.5 -800 {lab=vout90}
N 2480 -800 2500 -800 {lab=#net3}
N 2620 -800 2690 -800 {lab=Vout270}
N 1750 -460 1750 -420 {lab=VDD}
N 1750 -340 1750 -300 {lab=GND}
N 1640 -380 1700 -380 {lab=vin1}
N 1890 -380 1890 -360 {lab=Vout180}
N 1820 -380 1890 -380 {lab=Vout180}
N 1890 -300 1890 -270 {lab=GND}
N 1440 -340 1440 -280 {
lab=GND}
N 1440 -440 1440 -400 {lab=VDD}
N 1640 -800 1640 -380 {lab=vin1}
N 1560 -800 1640 -800 {
lab=vin1}
C {devices/gnd.sym} 1420 -690 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 1420 -760 0 0 {name=V1 value=1 savecurrent=false
spice_ignore=true}
C {devices/code_shown.sym} 755 -1285 0 0 {name=s1 only_toplevel=false 
value="
.save v(vin1) v(vgate) v(vout90) v(va) v(Vout270) v(Vout180)


.tran 10p 3n
.save all

*.ic v(vout) = 0

* 1. Medir Periodo (Referencia para cálculo)
.meas tran T_period 
+ TRIG v(vin1) VAL=0.6 RISE=3
+ TARG v(vin1) VAL=0.6 RISE=4

* 2. Medir Retardo (Delta T entre señales)
.meas tran T_delay 
+ TRIG v(vin1) VAL=0.6  RISE=3
+ TARG v(vout90) VAL=0.6  RISE=3

* 3. Calcular Fase en Grados
.meas tran Phase_Deg param = '(T_delay/T_period)*360'

.control
run
set color0=white
*plot v(vin1) v(vout)
plot v(vout) v(Vout270)
*plot v(vin1) v(Vout180)
*xlimit 2n 5n
*meas tran time TRIG v(va) VAl=0.6 
write tran_logic.raw

.endc
"}
C {devices/lab_pin.sym} 1560 -820 1 0 {name=p1 sig_type=std_logic lab=vin1}
C {devices/vsource.sym} 1760 -950 1 0 {name=Vdd1 value=1.2 savecurrent=false
}
C {devices/gnd.sym} 1810 -725 0 0 {name=l3 lab=GND
}
C {devices/gnd.sym} 1700 -920 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 2382.5 -687.5 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 1970 -720 1 0 {name=p3 sig_type=std_logic lab=vc}
C {devices/lab_pin.sym} 2382.5 -825 1 0 {name=p4 sig_type=std_logic lab=vout90}
C {devices/vsource.sym} 2382.5 -755 0 0 {name=Vdd3 value=0
spice_ignore=true}
C {devices/capa.sym} 2330 -750 0 0 {name=C1
m=1
value=10f
footprint=1206
device="ceramic capacitor"
}
C {devices/launcher.sym} 2156.25 -606.25 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} 1520 -760 0 0 {name=VIN1 value="PULSE(0 1.2 0 10p 10p 240p 500p)" savecurrent=false
}
C {devices/gnd.sym} 1520 -690 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 2170 -760 0 0 {name=l6 lab=GND
}
C {devices/lab_pin.sym} 1942.5 -865 1 0 {name=p5 sig_type=std_logic lab=va}
C {devices/vsource.sym} 1970 -630 0 0 {name=Vdd4 value=0.62 savecurrent=false
}
C {devices/launcher.sym} 2020 -1080 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic.raw tran"
}
C {devices/launcher.sym} 2038.125 -1018.75 0 0 {name=h1
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/gnd.sym} 1970 -580 0 0 {name=l9 lab=GND}
C {devices/code_shown.sym} 570 -1440 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
.include /foss/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice

"}
C {capa.sym} 2690 -750 0 0 {name=C2
m=1
value=1f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 2690 -690 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 2690 -800 2 0 {name=p6 sig_type=std_logic lab=Vout270}
C {devices/capa.sym} 2450 -800 1 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"
}
C {devices/lab_pin.sym} 1750 -460 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 1750 -300 0 0 {name=l1 lab=GND}
C {capa.sym} 1890 -330 0 0 {name=C4
m=1
value=0.1f
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 1890 -270 0 0 {name=l11 lab=GND}
C {devices/lab_pin.sym} 1890 -380 2 0 {name=p7 sig_type=std_logic lab=Vout180}
C {devices/vsource.sym} 1440 -370 0 0 {name=Vdd value=1.2}
C {devices/gnd.sym} 1440 -280 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 1440 -440 0 0 {name=p26 sig_type=std_logic lab=VDD}
C {/foss/designs/UNIC-CASS-Aug25-DelayLine/others/inv.sym} 2460 -660 0 0 {name=xQDLL}
C {/foss/designs/modificaciones/delay_variable.sym} 1830 -800 0 0 {name=x1}
C {/foss/designs/modificaciones/large_delay_vto1p1.sym} 2120 -800 0 0 {name=x2}
C {/foss/designs/UNIC-CASS-Aug25-PhaseInterpolator/inv.sym} 1660 -240 0 0 {name=x4}
