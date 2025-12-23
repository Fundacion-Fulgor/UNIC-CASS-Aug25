v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -0 -0 20 {lab=out}
N -80 -0 -60 0 {lab=in}
N -60 -50 -60 0 {lab=in}
N -60 -50 -40 -50 {lab=in}
N -60 0 -60 50 {lab=in}
N -60 50 -40 50 {lab=in}
N 0 -0 50 0 {lab=out}
N 0 -20 0 -0 {lab=out}
N -0 -120 0 -80 {lab=vcc}
N 20 -120 50 -120 {lab=vcc}
N 0 -50 20 -50 {lab=vcc}
N 20 -120 20 -50 {lab=vcc}
N 0 -120 20 -120 {lab=vcc}
N 20 110 60 110 {lab=vss}
N -0 80 -0 110 {lab=vss}
N -0 50 20 50 {lab=vss}
N 20 50 20 110 {lab=vss}
N 0 110 20 110 {lab=vss}
C {sg13g2_pr/sg13_lv_nmos.sym} -20 50 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -20 -50 0 0 {name=M2
l=0.13u
w=0.3u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} -80 0 2 0 {name=p1 lab=in}
C {iopin.sym} 50 0 0 0 {name=p2 lab=out}
C {iopin.sym} 50 -120 0 0 {name=p3 lab=vdd}
C {iopin.sym} 60 110 0 0 {name=p4 lab=vss}
