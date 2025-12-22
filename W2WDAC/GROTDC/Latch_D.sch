v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 530 -350 530 -310 {lab=VDD}
N 530 -210 530 -170 {lab=VSS}
N 440 -280 460 -280 {lab=#net1}
N 440 -400 440 -280 {lab=#net1}
N 420 -400 440 -400 {lab=#net1}
N 440 -240 440 -120 {lab=#net2}
N 440 -240 460 -240 {lab=#net2}
N 420 -120 440 -120 {lab=#net2}
N 280 -140 310 -140 {lab=#net3}
N 280 -380 280 -140 {lab=#net3}
N 280 -380 310 -380 {lab=#net3}
N 260 -100 310 -100 {lab=#net4}
N 350 -210 350 -170 {lab=#net5}
N 350 -70 350 -30 {lab=#net6}
N 190 -180 190 -140 {lab=#net7}
N 190 -60 190 -20 {lab=#net8}
N 100 -100 140 -100 {lab=#net9}
N 350 -350 350 -310 {lab=#net10}
N 350 -490 350 -450 {lab=#net11}
N 600 -280 640 -280 {lab=QN}
N 600 -240 640 -240 {lab=QP}
N 100 -420 310 -420 {lab=#net12}
C {SR_Latch.sym} 440 -170 0 0 {name=x1}
C {inv.sym} 100 40 0 0 {name=x4}
C {NAND.sym} 290 -30 0 0 {name=x2}
C {NAND.sym} 290 -310 0 0 {name=x3}
C {iopin.sym} 530 -350 0 0 {name=p1 lab=VDD}
C {iopin.sym} 530 -170 0 0 {name=p2 lab=VSS}
C {opin.sym} 640 -280 0 0 {name=p3 lab=QN}
C {opin.sym} 640 -240 0 0 {name=p4 lab=QP}
C {ipin.sym} 100 -420 0 0 {name=p5 lab=xxx}
C {ipin.sym} 100 -100 0 0 {name=p6 lab=xxx}
