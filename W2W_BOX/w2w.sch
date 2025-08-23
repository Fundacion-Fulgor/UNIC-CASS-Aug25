v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 520 -150 520 -90 {lab=S}
N 520 -90 580 -90 {lab=S}
N 520 -90 520 -30 {lab=S}
N 500 -180 520 -180 {lab=VSS}
N 500 -180 500 -130 {lab=VSS}
N 610 -90 610 -70 {lab=VSS}
N 560 -70 610 -70 {lab=VSS}
N 610 -180 610 -130 {lab=G}
N 520 -270 520 -210 {lab=#net1}
N 640 -90 700 -90 {lab=D}
N 520 -270 610 -270 {lab=#net1}
N 610 -330 610 -270 {lab=#net1}
N 610 -450 610 -390 {lab=DB}
N 650 -360 710 -360 {lab=B}
N 520 -360 610 -360 {lab=VSS}
N 430 -330 430 -270 {lab=#net1}
N 430 -450 430 -390 {lab=DBN}
N 330 -360 390 -360 {lab=#net2}
N 560 -180 610 -180 {lab=G}
N 610 -180 700 -180 {lab=G}
N 430 -270 520 -270 {lab=#net1}
N 520 -360 520 -330 {lab=VSS}
N 430 -360 520 -360 {lab=VSS}
N 260 -320 260 -270 {lab=VSS}
N 260 -450 260 -400 {lab=VDD}
N 160 -360 210 -360 {lab=B}
C {sg13g2_pr/sg13_lv_nmos.sym} 540 -180 2 0 {name=M2
l=\{Lnx\}
w=\{Wnx\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 630 -360 2 0 {name=M3
l=\{Lnx\}
w=\{Wnx\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 610 -110 3 1 {name=M4
l=\{Lnx\}
w=\{2*Wnx\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 410 -360 2 1 {name=M1
l=\{Lnx\}
w=\{Wnx\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 700 -180 0 0 {name=p1 lab=G}
C {iopin.sym} 520 -30 0 1 {name=p2 lab=S}
C {iopin.sym} 700 -90 0 0 {name=p3 lab=D}
C {iopin.sym} 260 -270 0 1 {name=p4 lab=VSS}
C {lab_wire.sym} 560 -70 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 500 -130 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 520 -330 0 0 {name=p7 sig_type=std_logic lab=VSS}
C {iopin.sym} 610 -450 0 0 {name=p8 lab=DB}
C {iopin.sym} 430 -450 0 1 {name=p9 lab=DBN}
C {ipin.sym} 710 -360 0 1 {name=p11 lab=B}
C {iopin.sym} 260 -450 0 1 {name=p10 lab=VDD
}
C {lab_wire.sym} 160 -360 0 0 {name=p12 sig_type=std_logic lab=B}
C {/foss/designs/W2W-DAC/W2W_BOX/inv.sym} 170 -220 0 0 {name=x1}
