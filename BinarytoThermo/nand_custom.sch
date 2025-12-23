v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -80 -40 -80 -20 {lab=out}
N -0 -20 70 -20 {lab=out}
N 70 -40 70 -20 {lab=out}
N 0 -0 -0 10 {lab=out}
N -80 -20 -0 -20 {lab=out}
N -190 10 -160 10 {lab=A}
N -160 -70 -160 10 {lab=A}
N -160 -70 -120 -70 {lab=A}
N -160 10 -160 40 {lab=A}
N -160 40 -40 40 {lab=A}
N -190 100 -110 100 {lab=B}
N -110 -0 -30 0 {lab=B}
N -30 -30 -30 0 {lab=B}
N -30 -30 20 -30 {lab=B}
N 20 -70 20 -30 {lab=B}
N 20 -70 30 -70 {lab=B}
N -110 100 -110 130 {lab=B}
N -110 130 -40 130 {lab=B}
N -80 -130 -80 -100 {lab=vdd}
N -10 -130 70 -130 {lab=vdd}
N 70 -120 70 -100 {lab=vdd}
N -10 -170 -10 -130 {lab=vdd}
N -60 -130 -10 -130 {lab=vdd}
N -80 -70 -60 -70 {lab=vdd}
N -60 -130 -60 -70 {lab=vdd}
N -80 -130 -60 -130 {lab=vdd}
N 70 -70 100 -70 {lab=vdd}
N 100 -120 100 -70 {lab=vdd}
N 70 -120 100 -120 {lab=vdd}
N 70 -130 70 -120 {lab=vdd}
N 0 190 0 230 {lab=vss}
N 0 130 50 130 {lab=vss}
N 50 130 50 190 {lab=vss}
N 0 190 50 190 {lab=vss}
N 0 160 0 190 {lab=vss}
N 0 40 50 40 {lab=vss}
N 0 -0 120 -0 {lab=out}
N -0 -20 0 -0 {lab=out}
N -0 70 -0 100 {lab=#net1}
N 50 40 50 130 {lab=vss}
N -110 0 -110 100 {lab=B}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 40 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -100 -70 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 130 0 0 {name=M3
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 50 -70 0 0 {name=M4
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} -190 10 2 0 {name=p1 lab=A}
C {iopin.sym} -190 100 2 0 {name=p2 lab=B}
C {iopin.sym} -10 -170 3 0 {name=p3 lab=vdd}
C {iopin.sym} 0 230 1 0 {name=p4 lab=vss}
C {iopin.sym} 120 0 0 0 {name=p5 lab=out}
