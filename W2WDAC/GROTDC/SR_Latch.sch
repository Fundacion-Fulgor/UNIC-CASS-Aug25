v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 190 -60 190 -20 {lab=VSS}
N 70 -310 150 -310 {lab=VS}
N 70 -90 150 -90 {lab=VR}
N 110 -130 150 -130 {lab=QN}
N 110 -270 150 -270 {lab=QP}
N 320 -290 340 -290 {lab=QN}
N 320 -110 340 -110 {lab=QP}
N 110 -270 110 -250 {lab=QP}
N 110 -150 110 -130 {lab=QN}
N 320 -290 320 -270 {lab=QN}
N 260 -290 320 -290 {lab=QN}
N 320 -130 320 -110 {lab=QP}
N 260 -110 320 -110 {lab=QP}
N 110 -150 320 -270 {lab=QN}
N 110 -250 320 -130 {lab=QP}
N 190 -240 190 -220 {lab=VSS}
N 190 -180 190 -160 {lab=VDD}
N 190 -380 190 -340 {lab=VDD}
C {iopin.sym} 190 -380 0 0 {name=p1 lab=VDD}
C {iopin.sym} 190 -20 0 0 {name=p2 lab=VSS}
C {ipin.sym} 70 -310 0 0 {name=p3 lab=VS}
C {ipin.sym} 70 -90 0 0 {name=p4 lab=VR}
C {opin.sym} 340 -110 0 0 {name=p5 lab=QP}
C {opin.sym} 340 -290 0 0 {name=p6 lab=QN}
C {lab_wire.sym} 190 -220 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 190 -180 0 1 {name=p8 sig_type=std_logic lab=VDD}
C {NAND.sym} 130 -200 0 0 {name=x1}
C {NAND.sym} 130 -20 0 0 {name=x2}
