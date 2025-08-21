v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 2130 -1855 2930 -1455 {flags=graph
y1=-0.0041
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="7 12 4"
node="VoutQ
VoutI
Vout"}
B 2 2980 -2295 3780 -1895 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color=12
node=vinI}
B 2 2980 -1855 3780 -1455 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color=7
node=vinQ}
N 1990 -1490 1990 -1430 {
lab=GND}
N 1990 -1590 1990 -1550 {lab=VDD}
N 1990 -1260 1990 -1240 {
lab=GND}
N 1990 -1380 1990 -1320 {
lab=vinI}
N 1970 -1380 1990 -1380 {
lab=vinI}
N 1990 -1070 1990 -1050 {
lab=GND}
N 1990 -1190 1990 -1130 {
lab=vinQ}
N 1970 -1190 1990 -1190 {
lab=vinQ}
N 2600 -1280 2670 -1280 {
lab=vinI}
N 2600 -1200 2670 -1200 {
lab=vinQ}
N 2800 -1400 2800 -1370 {lab=VDD}
N 2810 -1110 2810 -1080 {lab=GND}
N 3130 -1280 3200 -1280 {
lab=vinI}
N 3130 -1200 3200 -1200 {
lab=vinQ}
N 3330 -1400 3330 -1370 {lab=VDD}
N 3340 -1110 3340 -1080 {lab=GND}
N 3670 -1280 3740 -1280 {
lab=vinI}
N 3670 -1200 3740 -1200 {
lab=vinQ}
N 3880 -1110 3880 -1080 {lab=GND}
N 3870 -1400 3870 -1370 {lab=VDD}
N 2970 -1240 3000 -1240 {
lab=Vout}
N 3500 -1240 3530 -1240 {
lab=VoutI}
N 4040 -1240 4070 -1240 {
lab=VoutQ}
N 2970 -1140 2970 -1110 {lab=GND}
N 2970 -1240 2970 -1200 {lab=Vout}
N 2930 -1240 2970 -1240 {
lab=Vout}
N 3500 -1240 3500 -1200 {lab=VoutI}
N 3460 -1240 3500 -1240 {
lab=VoutI}
N 3500 -1140 3500 -1110 {lab=GND}
N 4040 -1240 4040 -1200 {lab=VoutQ}
N 4000 -1240 4040 -1240 {
lab=VoutQ}
N 4040 -1140 4040 -1110 {lab=GND}
N 2320 -1220 2320 -1160 {
lab=GND}
N 2320 -1320 2320 -1280 {lab=v1}
N 2420 -1220 2420 -1160 {
lab=GND}
N 2420 -1320 2420 -1280 {lab=v2}
N 2600 -1250 2670 -1250 {lab=v2}
N 2600 -1230 2670 -1230 {lab=v2}
N 3130 -1250 3200 -1250 {lab=v2}
N 3130 -1230 3200 -1230 {lab=v2}
N 3670 -1250 3740 -1250 {lab=v1}
N 3670 -1230 3740 -1230 {lab=v1}
C {devices/lab_pin.sym} 3530 -1240 2 0 {name=p2 sig_type=std_logic lab=VoutI}
C {devices/lab_pin.sym} 3130 -1280 0 0 {name=p3 sig_type=std_logic lab=vinI}
C {devices/code_shown.sym} 2120 -2170 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 0.05p 1n
meas tran tdelay1 TRIG v(VoutI) VAl=0.6 RISE=1 TARG v(Vout) VAl=0.6 RISE=1
meas tran tdelay2 TRIG v(Vout) VAl=0.6 RISE=1 TARG v(VoutQ) VAl=0.6 RISE=1
meas tran tdelay3 TRIG v(vinI) VAl=0.6 RISE=1 TARG v(VoutI) VAl=0.6 RISE=1
meas tran tdelay4 TRIG v(vinQ) VAl=0.6 RISE=1 TARG v(VoutQ) VAl=0.6 RISE=1
meas tran tdelay5 TRIG v(vinI) VAl=0.6 RISE=1 TARG v(Vout) VAl=0.6 RISE=1
meas tran tdelay6 TRIG v(vinQ) VAl=0.6 RISE=1 TARG v(Vout) VAl=0.6 RISE=1

write tran_logic_not.raw
.endc
"}
C {devices/launcher.sym} 2190 -2270 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic_not.raw tran"
}
C {devices/launcher.sym} 2190 -2230 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 2470 -2340 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/lab_pin.sym} 2600 -1200 0 0 {name=p7 sig_type=std_logic lab=vinQ}
C {devices/lab_pin.sym} 3000 -1240 2 0 {name=p9 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} 2600 -1280 0 0 {name=p13 sig_type=std_logic lab=vinI}
C {devices/lab_pin.sym} 3670 -1200 0 0 {name=p17 sig_type=std_logic lab=vinQ}
C {devices/lab_pin.sym} 4070 -1240 2 0 {name=p18 sig_type=std_logic lab=VoutQ}
C {devices/launcher.sym} 2190 -2230 0 0 {name=h1
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} 1990 -1520 0 0 {name=Vdd4 value=1.2}
C {devices/gnd.sym} 1990 -1430 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 1990 -1590 0 0 {name=p26 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 1990 -1240 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 1990 -1290 0 0 {name=Vin2 value="dc 0 ac 0 pulse(0, 1.2, 0, 125p, 125p, 125p, 500p ) "}
C {devices/lab_pin.sym} 1970 -1380 0 0 {name=p4 sig_type=std_logic lab=vinI}
C {devices/gnd.sym} 1990 -1050 0 0 {name=l9 lab=GND}
C {devices/lab_pin.sym} 1970 -1190 0 0 {name=p8 sig_type=std_logic lab=vinQ}
C {2X_PI.sym} 2660 -1100 0 0 {name=x1}
C {devices/lab_pin.sym} 2800 -1400 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 2810 -1080 0 0 {name=l1 lab=GND}
C {2X_PI.sym} 3190 -1100 0 0 {name=x2}
C {devices/lab_pin.sym} 3330 -1400 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 3340 -1080 0 0 {name=l2 lab=GND}
C {2X_PI.sym} 3730 -1100 0 0 {name=x3}
C {devices/gnd.sym} 3880 -1080 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 3870 -1400 0 0 {name=p14 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 1990 -1100 0 0 {name=Vin1 value="dc 0 ac 0 pulse(0, 1.2, 125p, 125p, 125p, 125p, 500p ) "}
C {capa.sym} 2970 -1170 0 0 {name=C1
m=1
value=2f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 2970 -1110 0 0 {name=l4 lab=GND
}
C {capa.sym} 3500 -1170 0 0 {name=C2
m=1
value=2f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 3500 -1110 0 0 {name=l5 lab=GND
}
C {capa.sym} 4040 -1170 0 0 {name=C3
m=1
value=2f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 4040 -1110 0 0 {name=l6 lab=GND
}
C {devices/lab_pin.sym} 3130 -1200 0 0 {name=p1 sig_type=std_logic lab=vinQ}
C {devices/lab_pin.sym} 3670 -1280 0 0 {name=p6 sig_type=std_logic lab=vinI}
C {devices/vsource.sym} 2320 -1250 0 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} 2320 -1160 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 2320 -1320 0 0 {name=p10 sig_type=std_logic lab=v1}
C {devices/vsource.sym} 2420 -1250 0 0 {name=Vdd2 value=0}
C {devices/gnd.sym} 2420 -1160 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 2420 -1320 0 0 {name=p11 sig_type=std_logic lab=v2}
C {devices/lab_pin.sym} 2600 -1250 0 0 {name=p15 sig_type=std_logic lab=v2}
C {devices/lab_pin.sym} 2600 -1230 0 0 {name=p16 sig_type=std_logic lab=v1}
C {devices/lab_pin.sym} 3130 -1250 0 0 {name=p19 sig_type=std_logic lab=v2}
C {devices/lab_pin.sym} 3130 -1230 0 0 {name=p20 sig_type=std_logic lab=v2}
C {devices/lab_pin.sym} 3670 -1250 0 0 {name=p21 sig_type=std_logic lab=v1}
C {devices/lab_pin.sym} 3670 -1230 0 0 {name=p22 sig_type=std_logic lab=v1}
