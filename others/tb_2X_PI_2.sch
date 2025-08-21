v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 2150 -1940 2950 -1540 {flags=graph
y1=-0.0025
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-08
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
B 2 2990 -2370 3790 -1970 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color=12
node=vinI}
B 2 3000 -1940 3800 -1540 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color=7
node=vinQ}
N 2020 -1610 2020 -1550 {
lab=GND}
N 2020 -1710 2020 -1670 {lab=VDD}
N 2020 -1380 2020 -1360 {
lab=GND}
N 2020 -1500 2020 -1440 {
lab=vinI}
N 2000 -1500 2020 -1500 {
lab=vinI}
N 2020 -1190 2020 -1170 {
lab=GND}
N 2020 -1310 2020 -1250 {
lab=vinQ}
N 2000 -1310 2020 -1310 {
lab=vinQ}
N 2330 -1280 2400 -1280 {
lab=vinI}
N 2330 -1200 2400 -1200 {
lab=vinQ}
N 2660 -1240 2730 -1240 {
lab=Vout}
N 2530 -1400 2530 -1370 {lab=VDD}
N 2540 -1110 2540 -1080 {lab=GND}
N 2860 -1280 2930 -1280 {
lab=vinI}
N 2860 -1200 2930 -1200 {
lab=vinI}
N 3190 -1240 3260 -1240 {
lab=VoutI}
N 3060 -1400 3060 -1370 {lab=VDD}
N 3070 -1110 3070 -1080 {lab=GND}
N 3400 -1280 3470 -1280 {
lab=vinQ}
N 3400 -1200 3470 -1200 {
lab=vinQ}
N 3730 -1240 3800 -1240 {
lab=VoutQ}
N 3610 -1110 3610 -1080 {lab=GND}
N 3600 -1400 3600 -1370 {lab=VDD}
C {devices/lab_pin.sym} 2860 -1200 0 0 {name=p1 sig_type=std_logic lab=vinI}
C {devices/lab_pin.sym} 3260 -1240 2 0 {name=p2 sig_type=std_logic lab=VoutI}
C {devices/lab_pin.sym} 2860 -1280 0 0 {name=p3 sig_type=std_logic lab=vinI}
C {devices/code_shown.sym} 2120 -2170 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 5p 10n
meas tran tdelay TRIG v(in) VAl=0.9 FALl=1 TARG v(out) VAl=0.9 RISE=1
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
C {devices/lab_pin.sym} 2330 -1200 0 0 {name=p7 sig_type=std_logic lab=vinQ}
C {devices/lab_pin.sym} 2730 -1240 2 0 {name=p9 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} 2330 -1280 0 0 {name=p13 sig_type=std_logic lab=vinI}
C {devices/lab_pin.sym} 3400 -1200 0 0 {name=p17 sig_type=std_logic lab=vinQ}
C {devices/lab_pin.sym} 3800 -1240 2 0 {name=p18 sig_type=std_logic lab=VoutQ}
C {devices/lab_pin.sym} 3400 -1280 0 0 {name=p19 sig_type=std_logic lab=vinQ}
C {devices/launcher.sym} 2190 -2230 0 0 {name=h1
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/vsource.sym} 2020 -1640 0 0 {name=Vdd4 value=1.2}
C {devices/gnd.sym} 2020 -1550 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 2020 -1710 0 0 {name=p26 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 2020 -1360 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 2020 -1410 0 0 {name=Vin2 value="dc 0 ac 0 pulse(0, 1.2, 0, 1n, 1n, 1n, 4n ) "}
C {devices/lab_pin.sym} 2000 -1500 0 0 {name=p4 sig_type=std_logic lab=vinI}
C {devices/gnd.sym} 2020 -1170 0 0 {name=l9 lab=GND}
C {devices/vsource.sym} 2020 -1220 0 0 {name=Vin3 value="dc 0 ac 0 pulse(0, 1.2, 1n, 1n, 1n, 1n, 4n ) "}
C {devices/lab_pin.sym} 2000 -1310 0 0 {name=p8 sig_type=std_logic lab=vinQ}
C {2X_PI.sym} 2390 -1100 0 0 {name=x1}
C {devices/lab_pin.sym} 2530 -1400 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 2540 -1080 0 0 {name=l1 lab=GND}
C {2X_PI.sym} 2920 -1100 0 0 {name=x2}
C {devices/lab_pin.sym} 3060 -1400 0 0 {name=p12 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 3070 -1080 0 0 {name=l2 lab=GND}
C {2X_PI.sym} 3460 -1100 0 0 {name=x3}
C {devices/gnd.sym} 3610 -1080 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 3600 -1400 0 0 {name=p14 sig_type=std_logic lab=VDD}
