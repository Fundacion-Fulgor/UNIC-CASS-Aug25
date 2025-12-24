v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 60 -160 100 -160 {lab=A}
N 60 -120 100 -120 {lab=B}
N 150 -220 150 -200 {lab=VDD}
N 150 -80 150 -60 {lab=VSS}
N 430 -140 460 -140 {lab=OUT}
N 250 -60 360 -60 {lab=VSS}
N 250 -220 360 -220 {lab=VDD}
N 360 -220 360 -180 {lab=VDD}
N 250 -240 250 -220 {lab=VDD}
N 150 -220 250 -220 {lab=VDD}
N 250 -60 250 -40 {lab=VSS}
N 150 -60 250 -60 {lab=VSS}
N 360 -100 360 -60 {lab=VSS}
C {inv.sym} 270 0 0 0 {name=x2}
C {ipin.sym} 60 -160 0 0 {name=p1 lab=A}
C {iopin.sym} 250 -240 0 0 {name=p2 lab=VDD}
C {opin.sym} 460 -140 0 0 {name=p3 lab=OUT}
C {iopin.sym} 250 -40 0 0 {name=p4 lab=VSS}
C {ipin.sym} 60 -120 0 0 {name=p5 lab=B}
C {nand_custom.sym} -120 -40 0 0 {name=x1}
