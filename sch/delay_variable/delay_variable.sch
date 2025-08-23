v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 -180 40 -180 { lab=VIN_D}
N 0 -180 0 -70 { lab=VIN_D}
N 0 -70 40 -70 { lab=VIN_D}
N 80 -260 80 -210 { lab=#net1}
N 80 -180 110 -180 { lab=VDD_D}
N 80 -70 110 -70 { lab=#net2}
N 110 -70 110 40 { lab=#net2}
N 80 -40 80 10 { lab=#net3}
N 80 80 80 150 {
lab=#net2}
N 80 -330 80 -320 {
lab=VDD_D}
N 80 -330 110 -330 {
lab=VDD_D}
N 110 -290 110 -180 {
lab=VDD_D}
N 80 -290 110 -290 {
lab=VDD_D}
N 80 80 110 80 {
lab=#net2}
N 80 40 110 40 {
lab=#net2}
N -110 -290 40 -290 {
lab=#net4}
N -170 -330 -170 -320 {
lab=VDD_D}
N -170 -330 80 -330 {
lab=VDD_D}
N -170 -240 -170 10 {
lab=#net4}
N -140 80 80 80 {
lab=#net2}
N -170 70 -170 80 {
lab=#net2}
N -170 -240 -110 -240 {
lab=#net4}
N -110 -290 -110 -240 {
lab=#net4}
N -170 40 -140 40 {
lab=#net2}
N -140 40 -140 80 {
lab=#net2}
N -210 0 -210 40 {
lab=VCONT_D}
N -210 0 40 0 {
lab=VCONT_D}
N 40 0 40 40 {
lab=VCONT_D}
N -200 -290 -170 -290 {
lab=VDD_D}
N 110 -330 110 -290 {
lab=VDD_D}
N 80 70 80 80 {
lab=#net2}
N -170 -260 -170 -240 {
lab=#net4}
N -130 -290 -110 -290 {
lab=#net4}
N -170 80 -140 80 {
lab=#net2}
N -260 40 -210 40 {lab=VCONT_D}
N -200 -330 -200 -290 {lab=VDD_D}
N -200 -330 -170 -330 {lab=VDD_D}
N 20 -390 80 -390 {lab=VDD_D}
N 80 -390 80 -330 {lab=VDD_D}
N 30 150 80 150 {lab=#net2}
N 110 40 110 80 {
lab=#net2}
N 80 -130 80 -100 { lab=VOUT_D}
N 80 -130 225 -130 {lab=VOUT_D}
N 80 -150 80 -130 { lab=VOUT_D}
C {devices/iopin.sym} 28.75 150 2 0 {name=p13 sig_type=std_logic lab=VSS_D}
C {devices/iopin.sym} 20 -390 2 0 {name=p17 sig_type=std_logic lab=VDD_D}
C {devices/opin.sym} 223.75 -130 0 0 {name=p5 lab=VOUT_D}
C {devices/ipin.sym} -260 40 0 0 {name=p8 lab=VCONT_D}
C {sg13g2_pr/sg13_lv_nmos.sym} -190 40 0 0 {name=M3
l=0.13u
w=1u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 60 40 0 0 {name=M5
l=2u
w=2u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} -150 -290 0 1 {name=M4
l=0.13u
w=2.24*1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 -290 0 0 {name=M6
l=2u
w=4*1u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/ipin.sym} 0 -131.25 0 0 {name=p1 lab=VIN_D}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 -180 0 0 {name=M7
l=2u
w=4*5u
ng=4
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 60 -70 0 0 {name=M8
l=3u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
