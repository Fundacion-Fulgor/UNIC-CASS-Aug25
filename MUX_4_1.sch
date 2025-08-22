v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 90 -330 130 -330 {lab=VINI}
N 90 -310 130 -310 {lab=VINQ}
N 90 -130 130 -130 {lab=VINIB}
N 90 -110 130 -110 {lab=VINQB}
N 180 -210 180 -170 {lab=VDD}
N 140 -270 140 -230 {lab=VSS}
N 140 -70 140 -30 {lab=VSS}
N 180 -410 180 -370 {lab=VDD}
N 180 -270 180 -230 {lab=VS[0]}
N 180 -70 180 -30 {lab=VS[0]}
N 380 -170 380 -130 {lab=VSS}
N 420 -310 420 -270 {lab=VDD}
N 420 -170 420 -130 {lab=VS2[1]}
N 290 -230 370 -230 {lab=#net1}
N 290 -210 370 -210 {lab=#net2}
N 290 -320 290 -230 {lab=#net1}
N 230 -320 290 -320 {lab=#net1}
N 230 -120 290 -120 {lab=#net2}
N 290 -210 290 -120 {lab=#net2}
N 470 -220 580 -220 {lab=VOUT}
C {MUX_2_1.sym} 100 -40 0 0 {name=x3}
C {MUX_2_1.sym} 100 -240 0 0 {name=x4}
C {lab_wire.sym} 180 -210 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 140 -230 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 180 -230 2 0 {name=p17 sig_type=std_logic lab=VS[0]}
C {MUX_2_1.sym} 340 -140 0 0 {name=x5}
C {lab_wire.sym} 140 -30 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 180 -410 2 0 {name=p21 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 420 -130 2 0 {name=p22 sig_type=std_logic lab=VS[1]}
C {lab_wire.sym} 180 -30 2 0 {name=p18 sig_type=std_logic lab=VS[0]}
C {opin.sym} 580 -220 0 0 {name=p2 lab=VOUT}
C {iopin.sym} 420 -310 0 0 {name=p1 lab=VDD}
C {iopin.sym} 380 -130 2 0 {name=p5 lab=VSS}
C {ipin.sym} 90 -330 0 0 {name=p3 lab=VINI}
C {ipin.sym} 90 -310 0 0 {name=p4 lab=VINQ}
C {ipin.sym} 90 -130 0 0 {name=p6 lab=VINIB}
C {ipin.sym} 90 -110 0 0 {name=p7 lab=VINQB}
C {ipin.sym} 100 -210 0 0 {name=p16 lab=VS[1:0]}
