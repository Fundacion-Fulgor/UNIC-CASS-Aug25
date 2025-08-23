v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 110 -180 110 -140 {lab=G}
N 150 -250 190 -250 {lab=VDD}
N 110 -180 190 -180 {lab=G}
N 110 -220 110 -180 {lab=G}
N 190 -180 190 -110 {lab=G}
N 150 -110 190 -110 {lab=G}
N 190 -110 230 -110 {lab=G}
N 110 -320 110 -280 {lab=IREF}
N 190 -320 190 -250 {lab=VDD}
N 90 -250 110 -250 {lab=VSS}
N 90 -250 90 -200 {lab=VSS}
N 90 -110 110 -110 {lab=VSS}
N 90 -110 90 -60 {lab=VSS}
N 110 -80 110 -40 {lab=VSS}
C {iopin.sym} 110 -40 0 0 {name=p1 lab=VSS}
C {iopin.sym} 110 -320 0 0 {name=p2 lab=IREF}
C {iopin.sym} 190 -320 0 0 {name=p3 lab=VDD}
C {iopin.sym} 230 -110 0 0 {name=p4 lab=G}
C {lab_wire.sym} 90 -60 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 90 -200 0 0 {name=p6 sig_type=std_logic lab=VSS}
C {sg13g2_pr/sg13_lv_nmos.sym} 130 -250 0 1 {name=M2
l=0.13u
w=0.13u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 130 -110 0 1 {name=M1
l=0.39u
w=0.3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
