v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 1330 -440 1440 -440 {lab=VOUT}
N 620 -640 660 -640 {lab=#net1}
N 580 -220 660 -220 {lab=#net2}
N 360 -700 400 -700 {lab=VINI}
N 360 -620 400 -620 {lab=VINIB}
N 360 -660 400 -660 {lab=VINQ}
N 360 -580 400 -580 {lab=VINQB}
N 360 -160 400 -160 {lab=VINI}
N 360 -240 400 -240 {lab=VINIB}
N 360 -280 400 -280 {lab=VINQ}
N 360 -200 400 -200 {lab=VINQB}
N 220 -540 260 -540 {lab=VINI}
N 220 -500 260 -500 {lab=VINQ}
N 410 -530 410 -490 {lab=VSS}
N 490 -790 490 -750 {lab=VDD}
N 220 -460 260 -460 {lab=VINIB}
N 220 -420 260 -420 {lab=VINQB}
N 410 -110 410 -70 {lab=VSS}
N 930 -440 1010 -440 {lab=#net3}
N 1060 -520 1060 -480 {lab=VDD}
N 1060 -400 1060 -360 {lab=VSS}
N 490 -370 490 -330 {lab=VDD}
N 490 -530 490 -490 {lab=VS[1:0]}
N 220 -380 260 -380 {lab=VS[1:0]}
N 220 -340 260 -340 {lab=VEN}
N 640 -440 680 -440 {lab=VEN}
N 490 -110 490 -70 {lab=VS[1:0]}
N 670 -720 670 -680 {lab=VDD}
N 670 -600 670 -560 {lab=VSS}
N 730 -720 730 -680 {lab=VSS}
N 730 -600 730 -560 {lab=VDD}
N 730 -400 730 -360 {lab=VSS}
N 730 -520 730 -480 {lab=VDD}
N 730 -180 730 -140 {lab=VEN}
N 800 -440 840 -440 {lab=VEN_b}
N 730 -300 730 -260 {lab=VEN_b}
N 810 -220 930 -220 {lab=#net3}
N 810 -640 930 -640 {lab=#net3}
N 930 -440 930 -220 {lab=#net3}
N 930 -640 930 -440 {lab=#net3}
N 670 -300 670 -260 {lab=VDD}
N 670 -180 670 -140 {lab=VSS}
N 1130 -440 1210 -440 {lab=#net4}
N 1260 -520 1260 -480 {lab=VDD}
N 1260 -400 1260 -360 {lab=VSS}
N 730 -820 730 -780 {lab=VEN}
N 730 -940 730 -900 {lab=VEN_b}
N 670 -940 670 -900 {lab=VDD}
N 670 -820 670 -780 {lab=VSS}
N 620 -860 620 -640 {lab=#net1}
N 580 -640 620 -640 {lab=#net1}
N 620 -860 650 -860 {lab=#net1}
N 810 -860 930 -860 {lab=#net3}
N 930 -860 930 -640 {lab=#net3}
C {iopin.sym} 490 -790 0 0 {name=p1 lab=VDD}
C {opin.sym} 1440 -440 0 0 {name=p2 lab=VOUT}
C {ipin.sym} 220 -540 0 0 {name=p3 lab=VINI}
C {ipin.sym} 220 -500 0 0 {name=p4 lab=VINQ}
C {iopin.sym} 410 -70 0 0 {name=p5 lab=VSS}
C {lab_wire.sym} 360 -700 0 0 {name=p8 sig_type=std_logic lab=VINI}
C {lab_wire.sym} 360 -620 0 0 {name=p9 sig_type=std_logic lab=VINIB}
C {lab_wire.sym} 360 -660 0 0 {name=p10 sig_type=std_logic lab=VINQ}
C {lab_wire.sym} 360 -580 0 0 {name=p11 sig_type=std_logic lab=VINQB}
C {ipin.sym} 220 -380 0 0 {name=p16 lab=VS[1:0]}
C {lab_wire.sym} 360 -160 0 0 {name=p23 sig_type=std_logic lab=VINI}
C {lab_wire.sym} 360 -240 0 0 {name=p24 sig_type=std_logic lab=VINIB}
C {lab_wire.sym} 360 -280 0 0 {name=p25 sig_type=std_logic lab=VINQ}
C {lab_wire.sym} 360 -200 0 0 {name=p26 sig_type=std_logic lab=VINQB}
C {MUX_4_1.sym} 280 -490 0 0 {name=x11}
C {lab_wire.sym} 410 -490 2 0 {name=p12 sig_type=std_logic lab=VSS}
C {MUX_4_1.sym} 280 -70 0 0 {name=x3}
C {ipin.sym} 220 -460 0 0 {name=p15 lab=VINIB}
C {ipin.sym} 220 -420 0 0 {name=p17 lab=VINQB}
C {inv.sym} 970 -300 0 0 {name=x4}
C {lab_wire.sym} 1060 -360 2 0 {name=p19 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1060 -520 2 0 {name=p14 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 490 -370 2 0 {name=p21 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 490 -490 2 0 {name=p22 sig_type=std_logic lab=VS[1:0]}
C {ipin.sym} 220 -340 0 0 {name=p18 lab=VEN}
C {lab_wire.sym} 640 -440 1 0 {name=p28 sig_type=std_logic lab=VEN}
C {lab_wire.sym} 490 -70 2 0 {name=p29 sig_type=std_logic lab=VS[1:0]}
C {transmission_gate.sym} 730 -640 0 0 {name=x5}
C {transmission_gate.sym} 730 -220 0 0 {name=x6[1:0]}
C {lab_wire.sym} 670 -720 2 0 {name=p27 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 670 -560 2 0 {name=p30 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 730 -720 0 0 {name=p31 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 730 -560 0 0 {name=p32 sig_type=std_logic lab=VDD}
C {inv.sym} 640 -300 0 0 {name=x7}
C {lab_wire.sym} 730 -520 2 0 {name=p34 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 730 -140 0 0 {name=p33 sig_type=std_logic lab=VEN}
C {lab_wire.sym} 840 -440 3 0 {name=p35 sig_type=std_logic lab=VEN_b
}
C {lab_wire.sym} 730 -300 2 0 {name=p36 sig_type=std_logic lab=VEN_b
}
C {lab_wire.sym} 730 -360 2 0 {name=p37 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 670 -300 2 0 {name=p38 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 670 -140 2 0 {name=p39 sig_type=std_logic lab=VSS}
C {inv.sym} 1170 -300 0 0 {name=x1[1:0]}
C {lab_wire.sym} 1260 -360 2 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 1260 -520 2 0 {name=p7 sig_type=std_logic lab=VDD}
C {transmission_gate.sym} 730 -860 0 0 {name=x2}
C {lab_wire.sym} 730 -780 2 0 {name=p13 sig_type=std_logic lab=VEN}
C {lab_wire.sym} 730 -940 2 0 {name=p20 sig_type=std_logic lab=VEN_b
}
C {lab_wire.sym} 670 -940 2 0 {name=p40 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 670 -780 2 0 {name=p41 sig_type=std_logic lab=VSS}
