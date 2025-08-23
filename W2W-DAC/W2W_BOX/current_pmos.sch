v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 60 -130 100 -130 {lab=DB}
N 60 -130 60 -60 {lab=DB}
N 20 -130 60 -130 {lab=DB}
N 60 -60 140 -60 {lab=DB}
N 140 -100 140 -60 {lab=DB}
N 140 -60 140 -20 {lab=DB}
N -20 -100 -20 -20 {lab=IOUT}
N -20 -200 -20 -160 {lab=VDD}
N 140 -200 140 -160 {lab=VDD}
N -40 -130 -20 -130 {lab=VDD}
N -40 -180 -40 -130 {lab=VDD}
N 140 -130 160 -130 {lab=VDD}
N 160 -180 160 -130 {lab=VDD}
N 60 -200 140 -200 {lab=VDD}
N 60 -240 60 -200 {lab=VDD}
N -20 -200 60 -200 {lab=VDD}
C {sg13g2_pr/sg13_lv_pmos.sym} 120 -130 0 0 {name=M1
l=0.39u
w=3.235u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -130 0 1 {name=M2
l=0.39u
w=3.235u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 60 -240 0 0 {name=p1 lab=VDD}
C {iopin.sym} 140 -20 0 0 {name=p2 lab=DB}
C {iopin.sym} -20 -20 0 0 {name=p3 lab=IOUT}
C {lab_wire.sym} -40 -180 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 160 -180 0 1 {name=p5 sig_type=std_logic lab=VDD}
