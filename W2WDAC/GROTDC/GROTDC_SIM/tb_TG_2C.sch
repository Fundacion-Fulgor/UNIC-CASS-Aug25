v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 1050 -900 1850 -500 {flags=graph
y1=-0.4
y2=1.5
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
color=11
node=VOUT}
B 2 1050 -1320 1850 -920 {flags=graph
y1=0
y2=1.3
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=2e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
color=11
node=VIN}
N 80 -940 80 -900 {lab=VSS}
N 300 -840 300 -810 {lab=VSS}
N 300 -940 300 -900 {lab=VIN}
N 200 -840 200 -810 {lab=VSS}
N 200 -940 200 -900 {lab=VDD}
N 540 -790 540 -770 {lab=VDD}
N 680 -710 720 -710 {lab=VOUT}
N 540 -650 540 -630 {lab=VSS}
N 440 -710 480 -710 {lab=VIN}
N 80 -840 80 -820 {lab=GND}
N 230 -600 270 -600 {lab=VCLK_N}
N 70 -600 110 -600 {lab=VCLK}
N 160 -560 160 -520 {lab=#net1}
N 160 -680 160 -640 {lab=VDD}
N 580 -810 580 -770 {lab=VCLK}
N 580 -650 580 -610 {lab=VCLKN}
N 680 -860 680 -830 {lab=VSS}
N 680 -960 680 -920 {lab=VCLK}
C {vsource.sym} 80 -870 0 0 {name=V1 value=0 savecurrent=false}
C {vsource.sym} 300 -870 0 0 {name=V3 value="dc 0 ac 0 pulse(0, 1.2, 0, 1p, 1p, 5n, 10n)" savecurrent=false}
C {gnd.sym} 80 -820 0 0 {name=l1 lab=GND}
C {lab_wire.sym} 80 -940 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 300 -810 0 0 {name=p4 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 300 -940 0 1 {name=p7 sig_type=std_logic lab=VIN
}
C {vsource.sym} 200 -870 0 0 {name=V5 value=1.2 savecurrent=false}
C {lab_wire.sym} 200 -810 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 200 -940 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {devices/code_shown.sym} 55 -1300 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=65
.control
save all 
tran 50p 20n
*let clk0 = v(CLK)
*let VB0 = v(B0)


*plot VB0
*plot VB1
*plot clk0
*plot clk1

write counter_tb.raw
set appendwrite
.endc
"}
C {devices/launcher.sym} 465 -1155 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/counter_tb.raw tran"
}
C {devices/launcher.sym} 465 -1215 0 0 {name=h1
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 400 -1300 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {lab_wire.sym} 540 -630 3 0 {name=p17 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 540 -790 0 0 {name=p22 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 720 -710 0 1 {name=p2 sig_type=std_logic lab=VOUT}
C {lab_wire.sym} 440 -710 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {TG_2C.sym} 440 -550 0 0 {name=x1}
C {inv.sym} 70 -460 0 0 {name=x10}
C {lab_wire.sym} 270 -600 0 1 {name=p5 sig_type=std_logic lab=VCLK_N}
C {lab_wire.sym} 580 -810 0 1 {name=p34 sig_type=std_logic lab=VCLK}
C {lab_wire.sym} 580 -610 0 1 {name=p6 sig_type=std_logic lab=VCLKN}
C {vsource.sym} 680 -890 0 0 {name=V2 value="dc 0 ac 0 pulse(0, 1.2, 0, 1p, 1p, 5n, 10n)" savecurrent=false}
C {lab_wire.sym} 680 -960 0 1 {name=p8 sig_type=std_logic lab=VCLK
}
C {lab_wire.sym} 680 -830 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 70 -600 0 0 {name=p10 sig_type=std_logic lab=VCLK}
C {lab_wire.sym} 160 -680 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 160 -520 0 0 {name=p14 sig_type=std_logic lab=VSS}
