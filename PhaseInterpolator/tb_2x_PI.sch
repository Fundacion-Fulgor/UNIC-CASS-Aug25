v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 870 -850 1670 -450 {flags=graph
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
B 2 1700 -850 2500 -450 {flags=graph
y1=-0.3
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
color="12 4 7"
node="voutI
vout
VoutQ"}
B 2 870 -430 1670 -30 {flags=graph
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
N 270 -400 420 -400 {lab=vinQ}
N 270 -400 270 -370 {lab=vinQ}
N 270 -310 270 -290 {lab=GND}
N 220 -400 270 -400 {lab=vinQ}
N 270 -740 420 -740 {lab=vinI}
N 270 -740 270 -710 {lab=vinI}
N 270 -650 270 -630 {lab=GND}
N 220 -740 270 -740 {lab=vinI}
N 620 -560 790 -560 {lab=vout}
N 50 -520 50 -460 {
lab=GND}
N 50 -650 50 -580 {
lab=VDD}
N 490 -660 490 -600 {
lab=GND}
N 540 -690 540 -600 {
lab=GND}
N 490 -690 540 -690 {
lab=GND}
N 490 -790 540 -790 {
lab=VDD}
N 490 -740 490 -720 {
lab=vout}
N 490 -890 490 -820 {
lab=VDD}
N 540 -890 540 -790 {
lab=VDD}
N 420 -690 450 -690 {
lab=vinI}
N 420 -790 450 -790 {
lab=vinI}
N 490 -740 620 -740 {
lab=vout}
N 490 -890 540 -890 {
lab=VDD}
N 420 -740 420 -690 {
lab=vinI}
N 490 -760 490 -740 {
lab=vout}
N 490 -320 490 -260 {
lab=GND}
N 540 -350 540 -260 {
lab=GND}
N 490 -350 540 -350 {
lab=GND}
N 490 -450 540 -450 {
lab=VDD}
N 490 -400 490 -380 {
lab=vout}
N 490 -550 490 -480 {
lab=VDD}
N 540 -550 540 -450 {
lab=VDD}
N 420 -350 450 -350 {
lab=vinQ}
N 420 -450 450 -450 {
lab=vinQ}
N 490 -400 620 -400 {
lab=vout}
N 490 -550 540 -550 {
lab=VDD}
N 420 -400 420 -350 {
lab=vinQ}
N 490 -420 490 -400 {
lab=vout}
N 420 -790 420 -740 {
lab=vinI}
N 420 -450 420 -400 {
lab=vinQ}
N 620 -560 620 -400 {lab=vout}
N 620 -740 620 -560 {lab=vout}
N 1620 -1020 1770 -1020 {lab=#net1}
N 1620 -1020 1620 -990 {lab=#net1}
N 1620 -930 1620 -910 {lab=GND}
N 1840 -940 1840 -880 {
lab=GND}
N 1890 -970 1890 -880 {
lab=GND}
N 1840 -970 1890 -970 {
lab=GND}
N 1840 -1070 1890 -1070 {
lab=VDD}
N 1840 -1020 1840 -1000 {
lab=voutI}
N 1840 -1170 1840 -1100 {
lab=VDD}
N 1890 -1170 1890 -1070 {
lab=VDD}
N 1770 -970 1800 -970 {
lab=#net1}
N 1770 -1070 1800 -1070 {
lab=#net1}
N 1840 -1020 1970 -1020 {
lab=voutI}
N 1840 -1170 1890 -1170 {
lab=VDD}
N 1770 -1020 1770 -970 {
lab=#net1}
N 1840 -1040 1840 -1020 {
lab=voutI}
N 1770 -1070 1770 -1020 {
lab=#net1}
N 2150 -1020 2300 -1020 {lab=#net2}
N 2150 -1020 2150 -990 {lab=#net2}
N 2150 -930 2150 -910 {lab=GND}
N 2370 -940 2370 -880 {
lab=GND}
N 2420 -970 2420 -880 {
lab=GND}
N 2370 -970 2420 -970 {
lab=GND}
N 2370 -1070 2420 -1070 {
lab=VDD}
N 2370 -1020 2370 -1000 {
lab=voutQ}
N 2370 -1170 2370 -1100 {
lab=VDD}
N 2420 -1170 2420 -1070 {
lab=VDD}
N 2300 -970 2330 -970 {
lab=#net2}
N 2300 -1070 2330 -1070 {
lab=#net2}
N 2370 -1020 2500 -1020 {
lab=voutQ}
N 2370 -1170 2420 -1170 {
lab=VDD}
N 2300 -1020 2300 -970 {
lab=#net2}
N 2370 -1040 2370 -1020 {
lab=voutQ}
N 2300 -1070 2300 -1020 {
lab=#net2}
C {devices/vsource.sym} 270 -340 0 0 {name=Vin value="dc 0 ac 0 pulse(0, 1.2, 1n, 1n, 1n, 1n, 4n ) "}
C {devices/gnd.sym} 270 -290 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} 220 -400 0 0 {name=p1 sig_type=std_logic lab=vinQ}
C {devices/vsource.sym} 270 -680 0 0 {name=Vin1 value="dc 0 ac 0 pulse(0, 1.2, 0, 1n, 1n, 1n, 4n ) "}
C {devices/gnd.sym} 270 -630 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 220 -740 0 0 {name=p2 sig_type=std_logic lab=vinI}
C {devices/lab_pin.sym} 790 -560 2 0 {name=p3 sig_type=std_logic lab=vout}
C {devices/code_shown.sym} 860 -1030 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 1p 10n
meas tran tdelay TRIG v(vinI) VAl=0.6 FALl=1 TARG v(vout) VAl=0.6 RISE=1
write tran_logic_not.raw
.endc
"}
C {devices/launcher.sym} 480 -1000 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic_not.raw tran"
}
C {devices/launcher.sym} 480 -930 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 10 -870 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/vsource.sym} 50 -550 0 0 {name=Vdd value=1.2}
C {devices/gnd.sym} 50 -460 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 50 -630 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 490 -600 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 540 -600 0 0 {name=l6 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 470 -690 0 0 {name=M1
l=130n
w=740n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 470 -790 0 0 {name=M2
l=130n
w=1.48u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/gnd.sym} 490 -260 0 0 {name=l7 lab=GND}
C {devices/gnd.sym} 540 -260 0 0 {name=l8 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 470 -350 0 0 {name=M3
l=130n
w=740n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 470 -450 0 0 {name=M4
l=130n
w=1.48u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 490 -550 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 490 -890 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} 1620 -960 0 0 {name=Vin2 value="dc 0 ac 0 pulse(0, 1.2, 0, 1n, 1n, 1n, 4n ) "}
C {devices/gnd.sym} 1620 -910 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 1840 -880 0 0 {name=l9 lab=GND}
C {devices/gnd.sym} 1890 -880 0 0 {name=l10 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 1820 -970 0 0 {name=M5
l=130n
w=740n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 1820 -1070 0 0 {name=M6
l=130n
w=1.48u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 1840 -1170 0 0 {name=p8 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1970 -1020 2 0 {name=p9 sig_type=std_logic lab=voutI}
C {devices/vsource.sym} 2150 -960 0 0 {name=Vin3 value="dc 0 ac 0 pulse(0, 1.2, 1n, 1n, 1n, 1n, 4n ) "}
C {devices/gnd.sym} 2150 -910 0 0 {name=l11 lab=GND}
C {devices/gnd.sym} 2370 -880 0 0 {name=l12 lab=GND}
C {devices/gnd.sym} 2420 -880 0 0 {name=l13 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 2350 -970 0 0 {name=M7
l=130n
w=740n
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 2350 -1070 0 0 {name=M8
l=130n
w=1.48u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 2370 -1170 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2500 -1020 2 0 {name=p12 sig_type=std_logic lab=voutQ}
