v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 1160 -420 1270 -420 {lab=VOUT}
N 580 -630 660 -630 {lab=#net1}
N 580 -220 660 -220 {lab=#net2}
N 710 -710 710 -670 {lab=VDD}
N 710 -180 710 -140 {lab=VSS}
N 710 -590 710 -550 {lab=VSS}
N 710 -300 710 -260 {lab=VDD}
N 360 -690 400 -690 {lab=VINI}
N 360 -610 400 -610 {lab=VINIB}
N 360 -650 400 -650 {lab=VINQ}
N 360 -570 400 -570 {lab=VINQB}
N 360 -160 400 -160 {lab=VINI}
N 360 -240 400 -240 {lab=VINIB}
N 360 -280 400 -280 {lab=VINQ}
N 360 -200 400 -200 {lab=VINQB}
N 960 -420 960 -220 {lab=#net3}
N 220 -540 260 -540 {lab=VINI}
N 220 -500 260 -500 {lab=VINQ}
N 780 -630 960 -630 {lab=#net3}
N 780 -220 960 -220 {lab=#net3}
N 410 -520 410 -480 {lab=VSS}
N 490 -780 490 -740 {lab=VDD}
N 220 -460 260 -460 {lab=VINIB}
N 220 -420 260 -420 {lab=VINQB}
N 410 -110 410 -70 {lab=VSS}
N 960 -420 1040 -420 {lab=#net3}
N 1090 -500 1090 -460 {lab=VDD}
N 1090 -380 1090 -340 {lab=VSS}
N 960 -630 960 -420 {lab=#net3}
N 490 -370 490 -330 {lab=VDD}
N 490 -520 490 -480 {lab=VS[1:0]}
N 470 -520 470 -480 {lab=VDD}
N 220 -380 260 -380 {lab=VS[1:0]}
N 220 -340 260 -340 {lab=VEN}
N 470 -110 470 -70 {lab=VDD}
N 490 -110 490 -70 {lab=VS[1:0]}
C {iopin.sym} 710 -710 0 0 {name=p1 lab=VDD}
C {opin.sym} 1270 -420 0 0 {name=p2 lab=VOUT}
C {ipin.sym} 220 -540 0 0 {name=p3 lab=VINI}
C {ipin.sym} 220 -500 0 0 {name=p4 lab=VINQ}
C {inv.sym} 620 -490 0 0 {name=x1}
C {inv.sym} 620 -80 0 0 {name=x2}
C {iopin.sym} 710 -140 0 0 {name=p5 lab=VSS}
C {lab_wire.sym} 710 -300 2 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 710 -550 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {res.sym} 1330 -910 3 0 {name=R1
value=250
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {res.sym} 1325 -830 3 0 {name=R2
value=250
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {lab_wire.sym} 360 -690 0 0 {name=p8 sig_type=std_logic lab=VINI}
C {lab_wire.sym} 360 -610 0 0 {name=p9 sig_type=std_logic lab=VINIB}
C {lab_wire.sym} 360 -650 0 0 {name=p10 sig_type=std_logic lab=VINQ}
C {lab_wire.sym} 360 -570 0 0 {name=p11 sig_type=std_logic lab=VINQB}
C {ipin.sym} 220 -380 0 0 {name=p16 lab=VS[1:0]}
C {lab_wire.sym} 360 -160 0 0 {name=p23 sig_type=std_logic lab=VINI}
C {lab_wire.sym} 360 -240 0 0 {name=p24 sig_type=std_logic lab=VINIB}
C {lab_wire.sym} 360 -280 0 0 {name=p25 sig_type=std_logic lab=VINQ}
C {lab_wire.sym} 360 -200 0 0 {name=p26 sig_type=std_logic lab=VINQB}
C {MUX_4_1_EN.sym} 130 -470 0 0 {name=x11}
C {lab_wire.sym} 410 -480 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {MUX_4_1_EN.sym} 130 -60 0 0 {name=x3}
C {lab_wire.sym} 490 -780 2 0 {name=p13 sig_type=std_logic lab=VDD}
C {ipin.sym} 220 -460 0 0 {name=p15 lab=VINIB}
C {ipin.sym} 220 -420 0 0 {name=p17 lab=VINQB}
C {lab_wire.sym} 410 -70 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {inv.sym} 1000 -280 0 0 {name=x4}
C {lab_wire.sym} 1090 -340 2 0 {name=p19 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1090 -500 2 0 {name=p14 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 490 -370 2 0 {name=p21 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 490 -480 2 0 {name=p22 sig_type=std_logic lab=VS[1:0]}
C {lab_wire.sym} 470 -480 0 0 {name=p27 sig_type=std_logic lab=VDD}
C {ipin.sym} 220 -340 0 0 {name=p18 lab=VEN}
C {lab_wire.sym} 470 -70 0 0 {name=p28 sig_type=std_logic lab=VEN}
C {lab_wire.sym} 490 -70 2 0 {name=p29 sig_type=std_logic lab=VS[1:0]}
