v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1030 -880 1830 -480 {flags=graph
y1=-0.4
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.2718061e-25
x2=1e-07
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
color=11
node=Q}
B 2 1040 -1300 1840 -900 {flags=graph
y1=-0.4
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.2718061e-25
x2=1e-07
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
color="11 10"
node="D
CLK"}
B 2 1040 -1720 1840 -1320 {flags=graph
y1=-0.4
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.2718061e-25
x2=1e-07
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
color=11
node=RESET}
N 610 -1090 610 -1060 {lab=VSS}
N 500 -1140 540 -1140 {lab=RESET}
N 500 -1180 540 -1180 {lab=CLK}
N 60 -870 60 -840 {lab=GND}
N 60 -970 60 -930 {lab=VSS}
N 60 -1030 60 -1000 {lab=VSS}
N 60 -1190 60 -1160 {lab=VSS}
N 60 -1130 60 -1090 {lab=CLK}
N 60 -1290 60 -1250 {lab=RESET}
N 130 -870 130 -840 {lab=VSS}
N 130 -970 130 -930 {lab=VDD}
N 610 -1310 610 -1270 {lab=VDD}
N 500 -1220 540 -1220 {lab=D}
N 680 -1220 740 -1220 {lab=Q}
N 680 -1140 740 -1140 {lab=QN}
N 200 -870 200 -840 {lab=VSS}
N 200 -970 200 -930 {lab=D}
C {FF_D.sym} 440 -1070 0 0 {name=x1}
C {vsource.sym} 60 -900 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} 60 -1060 0 0 {name=V3 value="dc 0 ac 0 pulse(0, 1.2, 0, 1p, 1p, 5n, 10n)" savecurrent=false}
C {gnd.sym} 60 -840 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 60 -970 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 610 -1060 0 0 {name=p2 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 60 -1000 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 60 -1160 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 60 -1130 0 1 {name=p7 sig_type=std_logic lab=CLK
}
C {lab_wire.sym} 60 -1290 0 1 {name=p8 sig_type=std_logic lab=RESET
}
C {lab_wire.sym} 500 -1220 0 0 {name=p9 sig_type=std_logic lab=D}
C {lab_wire.sym} 500 -1180 0 0 {name=p10 sig_type=std_logic lab=CLK
}
C {lab_wire.sym} 500 -1140 0 0 {name=p11 sig_type=std_logic lab=RESET
}
C {vsource.sym} 130 -900 0 0 {name=V5 value=1.2 savecurrent=false}
C {lab_wire.sym} 130 -840 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 130 -970 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 610 -1310 0 0 {name=p14 sig_type=std_logic lab=VDD}
C {vsource.sym} 60 -1220 0 0 {name=V4 value="dc 0 ac 0 pulse(0, 1.2, 30n, 1p, 1p, 5n, 0)" savecurrent=false}
C {devices/code_shown.sym} 25 -1680 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=65
.control
save all 
tran 50p 100n
let clk0 = v(CLK)
*let VB0 = v(B0)


*plot VB0
*plot VB1
*plot clk0
*plot clk1

write counter_tb.raw
set appendwrite
.endc
"}
C {devices/launcher.sym} 465 -1375 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/counter_tb.raw tran"
}
C {devices/launcher.sym} 465 -1435 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 30 -1360 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_wire.sym} 740 -1220 0 1 {name=p3 sig_type=std_logic lab=Q}
C {lab_wire.sym} 740 -1140 0 1 {name=p6 sig_type=std_logic lab=QN}
C {vsource.sym} 200 -900 0 0 {name=V2 value="dc 0 ac 0 pulse(0, 1.2, 0, 1p, 1p, 20n, 40n)" savecurrent=false}
C {lab_wire.sym} 200 -840 0 0 {name=p15 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 200 -970 0 1 {name=p16 sig_type=std_logic lab=D
}
