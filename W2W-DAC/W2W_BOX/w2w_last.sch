v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 50 -180 70 -180 {lab=VSS}
N 50 -180 50 -130 {lab=VSS}
N 70 -270 70 -210 {lab=#net1}
N 70 -270 160 -270 {lab=#net1}
N 160 -330 160 -270 {lab=#net1}
N 160 -450 160 -390 {lab=DB}
N 200 -360 260 -360 {lab=B}
N 70 -360 160 -360 {lab=VSS}
N -20 -330 -20 -270 {lab=#net1}
N -20 -450 -20 -390 {lab=DBN}
N -120 -360 -60 -360 {lab=#net2}
N 110 -180 250 -180 {lab=G}
N -20 -270 70 -270 {lab=#net1}
N 70 -360 70 -330 {lab=VSS}
N -20 -360 70 -360 {lab=VSS}
N -190 -320 -190 -270 {lab=VSS}
N -190 -450 -190 -400 {lab=VDD}
N -290 -360 -240 -360 {lab=B}
N 70 -150 70 -90 {lab=S}
C {sg13g2_pr/sg13_lv_nmos.sym} 90 -180 2 0 {name=M2
l=0.39u
w=0.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 180 -360 2 0 {name=M3
l=0.13u
w=0.13u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -40 -360 2 1 {name=M1
l=0.13u
w=0.13u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {iopin.sym} 250 -180 0 0 {name=p1 lab=G}
C {iopin.sym} 70 -90 0 1 {name=p2 lab=S}
C {iopin.sym} -190 -270 0 1 {name=p4 lab=VSS}
C {lab_wire.sym} 50 -130 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 70 -330 0 0 {name=p7 sig_type=std_logic lab=VSS}
C {iopin.sym} 160 -450 0 0 {name=p8 lab=DB}
C {iopin.sym} -20 -450 0 1 {name=p9 lab=DBN}
C {ipin.sym} 260 -360 0 1 {name=p11 lab=B}
C {iopin.sym} -190 -450 0 1 {name=p10 lab=VDD
}
C {lab_wire.sym} -290 -360 0 0 {name=p12 sig_type=std_logic lab=B}
C {inv.sym} -280 -220 0 0 {name=x1}
