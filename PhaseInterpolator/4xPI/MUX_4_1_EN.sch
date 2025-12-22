v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 80 -320 120 -320 {lab=VINI}
N 80 -300 120 -300 {lab=VINQ}
N 80 -120 120 -120 {lab=VINIB}
N 80 -100 120 -100 {lab=VINQB}
N 170 -200 170 -160 {lab=VDD}
N 130 -260 130 -220 {lab=VSS}
N 130 -60 130 -20 {lab=VSS}
N 170 -400 170 -360 {lab=VDD}
N 170 -260 170 -220 {lab=VS[0]}
N 170 -60 170 -20 {lab=VS[0]}
N 370 -160 370 -120 {lab=VSS}
N 410 -300 410 -260 {lab=VDD}
N 410 -160 410 -120 {lab=VS[1]}
N 280 -310 280 -220 {lab=#net1}
N 220 -310 280 -310 {lab=#net1}
N 220 -110 280 -110 {lab=#net2}
N 280 -200 280 -110 {lab=#net2}
N 650 -300 650 -250 {lab=VENB}
N 590 -300 590 -250 {lab=VDD}
N 590 -170 590 -120 {lab=VSS}
N 650 -170 650 -130 {lab=VEN}
N 570 -510 570 -490 {lab=VDD}
N 570 -410 570 -390 {lab=VSS}
N 480 -450 520 -450 {lab=VEN}
N 730 -210 770 -210 {lab=VOUT}
N 460 -210 570 -210 {lab=#net3}
N 280 -220 360 -220 {lab=#net1}
N 280 -200 360 -200 {lab=#net2}
N 640 -450 680 -450 {lab=VENB}
C {lab_wire.sym} 170 -200 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 130 -220 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 170 -220 2 0 {name=p17 sig_type=std_logic lab=VS[0]}
C {MUX_2_1.sym} 330 -130 0 0 {name=x5}
C {lab_wire.sym} 130 -20 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 170 -400 2 0 {name=p21 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 410 -120 2 0 {name=p22 sig_type=std_logic lab=VS[1]}
C {lab_wire.sym} 170 -20 2 0 {name=p18 sig_type=std_logic lab=VS[0]}
C {opin.sym} 770 -210 0 0 {name=p2 lab=VOUT
}
C {iopin.sym} 410 -300 0 0 {name=p1 lab=VDD}
C {iopin.sym} 370 -120 2 0 {name=p5 lab=VSS}
C {ipin.sym} 80 -320 0 0 {name=p3 lab=VINI}
C {ipin.sym} 80 -300 0 0 {name=p4 lab=VINQ}
C {ipin.sym} 80 -120 0 0 {name=p6 lab=VINIB}
C {ipin.sym} 80 -100 0 0 {name=p7 lab=VINQB}
C {ipin.sym} 90 -200 0 0 {name=p16 lab=VS[1:0]}
C {transmission_gate.sym} 650 -210 0 0 {name=x1
}
C {lab_wire.sym} 590 -120 2 0 {name=p10 sig_type=std_logic lab=VSS
}
C {lab_wire.sym} 650 -130 2 0 {name=p11 sig_type=std_logic lab=VEN
}
C {inv.sym} 480 -310 0 0 {name=x2
}
C {lab_wire.sym} 570 -510 2 0 {name=p14 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 570 -390 2 0 {name=p15 sig_type=std_logic lab=VSS
}
C {ipin.sym} 480 -450 0 0 {name=p19 lab=VEN
}
C {lab_wire.sym} 680 -450 2 0 {name=p23 sig_type=std_logic lab=VENB
}
C {lab_wire.sym} 650 -300 2 0 {name=p8 sig_type=std_logic lab=VENB
}
C {lab_wire.sym} 590 -300 2 0 {name=p24 sig_type=std_logic lab=VDD}
C {MUX_2_1.sym} 90 -230 0 0 {name=x3}
C {MUX_2_1.sym} 90 -30 0 0 {name=x4}
