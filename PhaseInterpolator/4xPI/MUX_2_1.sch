v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 430 -240 430 -170 {lab=#net1}
N 280 -360 350 -360 {lab=VINA}
N 280 -130 350 -130 {lab=VINB}
N 510 -360 580 -360 {lab=VOUT}
N 510 -130 580 -130 {lab=VOUT}
N 580 -240 650 -240 {lab=VOUT}
N 580 -240 580 -130 {lab=VOUT}
N 430 -90 430 -40 {lab=VS}
N 430 -450 430 -400 {lab=VS}
N 370 -450 370 -400 {lab=VDD}
N 370 -90 370 -40 {lab=VSS}
N 580 -360 580 -240 {lab=VOUT}
N 370 -320 370 -270 {lab=VSS}
N 370 -220 370 -170 {lab=VDD}
N 300 -240 430 -240 {lab=#net1}
N 430 -320 430 -240 {lab=#net1}
N 110 -240 180 -240 {lab=VS}
N 230 -300 230 -280 {lab=VDD}
N 230 -200 230 -180 {lab=#net2}
C {transmission_gate.sym} 430 -360 0 0 {name=x1}
C {transmission_gate.sym} 430 -130 0 0 {name=x2}
C {inv.sym} 140 -100 0 0 {name=x3}
C {opin.sym} 650 -240 0 0 {name=p2 lab=VOUT}
C {ipin.sym} 280 -360 0 0 {name=p3 lab=VINA}
C {ipin.sym} 280 -130 0 0 {name=p1 lab=VINB}
C {ipin.sym} 110 -240 0 0 {name=p4 lab=VS}
C {lab_wire.sym} 430 -40 2 0 {name=p6 sig_type=std_logic lab=VS}
C {lab_wire.sym} 430 -450 2 0 {name=p5 sig_type=std_logic lab=VS}
C {iopin.sym} 370 -450 2 0 {name=p7 lab=VDD}
C {iopin.sym} 370 -40 2 0 {name=p8 lab=VSS}
C {lab_wire.sym} 370 -270 2 0 {name=p10 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 370 -220 2 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 230 -300 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 230 -180 2 0 {name=p13 sig_type=std_logic lab=VSS}
