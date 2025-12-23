v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -70 10 -70 30 {lab=out}
N 90 10 90 30 {lab=out}
N 0 10 90 10 {lab=out}
N 0 -170 0 -160 {lab=vdd}
N -0 -100 -0 -70 {lab=#net1}
N 0 -10 0 10 {lab=out}
N -70 10 0 10 {lab=out}
N -0 -130 30 -130 {lab=vdd}
N 30 -170 30 -130 {lab=vdd}
N 0 -170 30 -170 {lab=vdd}
N 0 -180 0 -170 {lab=vdd}
N -0 -40 30 -40 {lab=vdd}
N 30 -130 30 -40 {lab=vdd}
N -70 90 -70 120 {lab=vss}
N -0 120 90 120 {lab=vss}
N 90 110 90 120 {lab=vss}
N -0 120 -0 140 {lab=vss}
N -50 120 -0 120 {lab=vss}
N -70 60 -50 60 {lab=vss}
N -50 60 -50 120 {lab=vss}
N -70 120 -50 120 {lab=vss}
N 90 60 120 60 {lab=vss}
N 120 60 120 110 {lab=vss}
N 90 110 120 110 {lab=vss}
N 90 90 90 110 {lab=vss}
N -190 -70 -140 -70 {lab=A}
N -140 -130 -140 -70 {lab=A}
N -140 -130 -40 -130 {lab=A}
N -140 -70 -140 -20 {lab=A}
N -140 -20 -40 -20 {lab=A}
N -40 -20 -40 20 {lab=A}
N -40 20 30 20 {lab=A}
N 30 20 30 60 {lab=A}
N 30 60 50 60 {lab=A}
N -190 40 -110 40 {lab=B}
N -110 -40 -110 40 {lab=B}
N -110 -40 -40 -40 {lab=B}
N -110 40 -110 60 {lab=B}
N 90 10 150 10 {lab=out}
C {sg13g2_pr/sg13_lv_nmos.sym} -90 60 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -40 0 0 {name=M2
l=0.13u
w=0.45u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 70 60 0 0 {name=M3
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -130 0 0 {name=M4
l=0.13u
w=0.45u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 0 -180 3 0 {name=p3 lab=vdd}
C {iopin.sym} 0 140 1 0 {name=p4 lab=vss}
C {iopin.sym} -190 -70 2 0 {name=p1 lab=A}
C {iopin.sym} -190 40 2 0 {name=p2 lab=B}
C {iopin.sym} 150 10 0 0 {name=p5 lab=out}
