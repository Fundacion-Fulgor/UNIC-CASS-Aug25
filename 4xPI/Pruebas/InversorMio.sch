v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 -80 20 -30 {lab=Vout}
N 20 -80 80 -80 {lab=Vout}
N 20 -130 20 -80 {lab=Vout}
N 20 -160 40 -160 {lab=Vdd}
N 40 -210 40 -160 {lab=Vdd}
N 20 -210 40 -210 {lab=Vdd}
N 20 -210 20 -190 {lab=Vdd}
N 20 -230 20 -210 {lab=Vdd}
N -60 -160 -20 -160 {lab=Vin}
N -60 -80 -60 -0 {lab=Vin}
N -60 -0 -20 -0 {lab=Vin}
N 20 -0 40 0 {lab=Vss}
N 40 -0 40 50 {lab=Vss}
N 20 50 40 50 {lab=Vss}
N 20 30 20 50 {lab=Vss}
N 20 50 20 70 {lab=Vss}
N -120 -80 -60 -80 {lab=Vin}
N -60 -160 -60 -80 {lab=Vin}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 0 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 0 -160 0 0 {name=M2
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {iopin.sym} 20 70 0 0 {name=p1 lab=Vss}
C {iopin.sym} 20 -230 0 0 {name=p2 lab=Vdd}
C {ipin.sym} -120 -80 0 0 {name=p3 lab=Vin}
C {opin.sym} 80 -80 0 0 {name=p4 lab=Vout
}
