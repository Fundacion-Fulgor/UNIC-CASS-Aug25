v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1330 -945 2410 -405 {flags=graph
y1=-1.128
y2=0.452
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7.5e-11
x2=1.425e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="12 7"
node="VoutIB
vinIB"}
B 2 1330 -1545 2410 -1005 {flags=graph
y1=-0.18
y2=1.4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7.5e-11
x2=1.425e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="12 7"
node="VoutI
vinI"}
B 2 2490 -945 3570 -405 {flags=graph
y1=-0.18
y2=1.4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7.5e-11
x2=1.425e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="12 7"
node="VoutQB
vinQB"}
B 2 2490 -1545 3570 -1005 {flags=graph
y1=-0.18
y2=1.4
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7.5e-11
x2=1.425e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="12 7"
node="VoutQ
vinQ"}
B 2 90 -1785 1170 -1245 {flags=graph
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=-7.5e-11
x2=1.425e-09
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="12 7 6 9 21"
node="VoutI_
VoutQ_
VoutIB_
VoutQB_
Vout"
y1=-0.039}
N 910 -770 910 -710 {
lab=GND}
N 910 -870 910 -830 {lab=VDD}
N 160 -600 160 -580 {
lab=GND}
N 160 -720 160 -660 {
lab=vinI}
N 140 -720 160 -720 {
lab=vinI}
N 160 -410 160 -390 {
lab=GND}
N 160 -530 160 -470 {
lab=vinQ}
N 140 -530 160 -530 {
lab=vinQ}
N 1110 -770 1110 -710 {
lab=GND}
N 1110 -870 1110 -830 {lab=v1}
N 1010 -770 1010 -710 {
lab=GND}
N 1010 -870 1010 -830 {lab=v0}
N 480 -600 480 -580 {
lab=GND}
N 480 -720 480 -660 {
lab=vinIB}
N 460 -720 480 -720 {
lab=vinIB}
N 480 -410 480 -390 {
lab=GND}
N 480 -530 480 -470 {
lab=vinQB}
N 460 -530 480 -530 {
lab=vinQB}
N 1030 -450 1030 -420 {lab=GND}
N 1030 -650 1030 -610 {lab=VDD}
N 860 -560 880 -560 {
lab=vinI}
N 860 -540 880 -540 {
lab=vinQ}
N 860 -520 880 -520 {
lab=vinIB}
N 860 -500 880 -500 {
lab=vinQB}
N 1180 -560 1210 -560 {
lab=VoutI}
N 1180 -540 1210 -540 {
lab=VoutQ}
N 1180 -520 1210 -520 {
lab=VoutIB}
N 1180 -500 1210 -500 {
lab=VoutQB}
N 1900 -70 1900 -40 {lab=GND}
N 1980 -70 1980 -30 {lab="v0, v1"}
N 2070 -180 2100 -180 {
lab=Vout}
N 1840 -240 1890 -240 {
lab=VoutI}
N 1840 -200 1890 -200 {
lab=VoutQ}
N 1840 -160 1890 -160 {
lab=VoutIB}
N 1840 -120 1890 -120 {
lab=VoutQB}
N 1960 -70 1960 -30 {lab=v0}
N 1980 -330 1980 -290 {lab=VDD}
C {devices/vsource.sym} 910 -800 0 0 {name=Vdd4 value=1.2}
C {devices/gnd.sym} 910 -710 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 910 -870 0 0 {name=p26 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 160 -580 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 160 -630 0 0 {name=Vin2 value="dc 0 ac 0 pulse(0, 1.2, 0, 25p, 25p, 225p, 500p ) "}
C {devices/lab_pin.sym} 140 -720 0 0 {name=p4 sig_type=std_logic lab=vinI}
C {devices/gnd.sym} 160 -390 0 0 {name=l9 lab=GND
spice_ignore=short}
C {devices/lab_pin.sym} 140 -530 0 0 {name=p8 sig_type=std_logic lab=vinQ}
C {devices/vsource.sym} 160 -440 0 0 {name=Vin1 value="dc 0 ac 0 pulse(0, 1.2, 125p, 25p, 25p, 225p, 500p ) "}
C {devices/vsource.sym} 1110 -800 0 0 {name=Vs2 value=1.2}
C {devices/gnd.sym} 1110 -710 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} 1110 -870 0 0 {name=p10 sig_type=std_logic lab=v1}
C {devices/vsource.sym} 1010 -800 0 0 {name=Vs1 value=0}
C {devices/gnd.sym} 1010 -710 0 0 {name=l10 lab=GND}
C {devices/lab_pin.sym} 1010 -870 0 0 {name=p11 sig_type=std_logic lab=v0}
C {devices/lab_pin.sym} 290 -330 0 0 {name=p3 sig_type=std_logic lab=VDD
spice_ignore=true}
C {devices/gnd.sym} 480 -580 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 480 -630 0 0 {name=Vin3 value="dc 0 ac 0 pulse(0, 1.2, 250p, 25p, 25p, 225p, 500p ) "}
C {devices/lab_pin.sym} 460 -720 0 0 {name=p5 sig_type=std_logic lab=vinIB}
C {devices/gnd.sym} 210 -40 0 0 {name=l2 lab=GND
spice_ignore=true}
C {devices/gnd.sym} 480 -390 0 0 {name=l3 lab=GND
spice_ignore=short}
C {devices/vsource.sym} 480 -440 0 0 {name=Vin4 value="dc 0 ac 0 pulse(0, 1.2, 375p, 25p, 25p, 225p, 500p ) "}
C {devices/lab_pin.sym} 460 -530 0 0 {name=p7 sig_type=std_logic lab=vinQB}
C {devices/lab_pin.sym} 290 -30 2 0 {name=p16 sig_type=std_logic lab="v0, v0"
spice_ignore=true}
C {devices/code_shown.sym} 60 -1020 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 0.5p 1.5n

write tran_logic_mux.raw
.endc
"}
C {devices/launcher.sym} 130 -1080 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic_mux.raw tran"
}
C {devices/code_shown.sym} 410 -1190 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/launcher.sym} 130 -1130 0 0 {name=h1
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {4to4.sym} 1030 -530 0 0 {name=x2}
C {devices/gnd.sym} 1030 -420 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 1030 -650 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 860 -560 0 0 {name=p14 sig_type=std_logic lab=vinI}
C {devices/lab_pin.sym} 860 -540 0 0 {name=p15 sig_type=std_logic lab=vinQ}
C {devices/lab_pin.sym} 860 -520 0 0 {name=p17 sig_type=std_logic lab=vinIB}
C {devices/lab_pin.sym} 860 -500 0 0 {name=p18 sig_type=std_logic lab=vinQB}
C {devices/lab_pin.sym} 1210 -560 2 0 {name=p19 sig_type=std_logic lab=VoutI}
C {devices/lab_pin.sym} 1210 -540 2 0 {name=p20 sig_type=std_logic lab=VoutQ}
C {devices/lab_pin.sym} 1210 -520 2 0 {name=p21 sig_type=std_logic lab=VoutIB}
C {devices/lab_pin.sym} 1210 -500 2 0 {name=p22 sig_type=std_logic lab=VoutQB}
C {devices/lab_pin.sym} 150 -240 2 1 {name=p1 sig_type=std_logic lab=VoutI
spice_ignore=true}
C {devices/lab_pin.sym} 150 -200 2 1 {name=p2 sig_type=std_logic lab=VoutQ
spice_ignore=true}
C {devices/lab_pin.sym} 150 -160 2 1 {name=p6 sig_type=std_logic lab=VoutIB
spice_ignore=true}
C {devices/lab_pin.sym} 150 -120 2 1 {name=p9 sig_type=std_logic lab=VoutQB
spice_ignore=true}
C {devices/lab_pin.sym} 690 -330 0 0 {name=p23 sig_type=std_logic lab=VDD
spice_ignore=true}
C {devices/gnd.sym} 610 -40 0 0 {name=l5 lab=GND
spice_ignore=true}
C {devices/lab_pin.sym} 690 -30 2 0 {name=p24 sig_type=std_logic lab="v0, v1"
spice_ignore=true}
C {devices/lab_pin.sym} 1090 -330 0 0 {name=p31 sig_type=std_logic lab=VDD
spice_ignore=true}
C {devices/gnd.sym} 1010 -40 0 0 {name=l6 lab=GND
spice_ignore=true}
C {devices/lab_pin.sym} 1090 -30 2 0 {name=p32 sig_type=std_logic lab="v1, v0"
spice_ignore=true}
C {devices/lab_pin.sym} 1510 -330 0 0 {name=p38 sig_type=std_logic lab=VDD
spice_ignore=true}
C {devices/gnd.sym} 1430 -40 0 0 {name=l11 lab=GND
spice_ignore=true}
C {devices/lab_pin.sym} 1510 -30 2 0 {name=p39 sig_type=std_logic lab="v1, v1"
spice_ignore=true}
C {devices/gnd.sym} 1900 -40 0 0 {name=l12 lab=GND
}
C {devices/lab_pin.sym} 1980 -30 2 0 {name=p45 sig_type=std_logic lab="v0, v1"}
C {devices/lab_pin.sym} 2100 -180 2 0 {name=p46 sig_type=std_logic lab=Vout
}
C {devices/lab_pin.sym} 1840 -240 2 1 {name=p47 sig_type=std_logic lab=VoutI
}
C {devices/lab_pin.sym} 1840 -200 2 1 {name=p48 sig_type=std_logic lab=VoutQ
}
C {devices/lab_pin.sym} 1840 -160 2 1 {name=p49 sig_type=std_logic lab=VoutIB
}
C {devices/lab_pin.sym} 1840 -120 2 1 {name=p50 sig_type=std_logic lab=VoutQB
}
C {devices/lab_pin.sym} 1960 -30 0 0 {name=p51 sig_type=std_logic lab=v0
}
C {devices/lab_pin.sym} 1980 -330 0 0 {name=p59 sig_type=std_logic lab=VDD
}
C {MUX_4_1_EN.sym} 1620 -20 0 0 {name=x6
}
C {devices/lab_pin.sym} 1490 -30 0 0 {name=p52 sig_type=std_logic lab=v1
spice_ignore=true}
C {devices/lab_pin.sym} 1070 -30 0 0 {name=p53 sig_type=std_logic lab=v1
spice_ignore=true}
C {devices/lab_pin.sym} 670 -30 0 0 {name=p54 sig_type=std_logic lab=v1
spice_ignore=true}
C {devices/lab_pin.sym} 270 -30 0 0 {name=p55 sig_type=std_logic lab=v1
spice_ignore=true}
