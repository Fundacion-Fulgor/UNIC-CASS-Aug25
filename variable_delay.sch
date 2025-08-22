v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 0 -180 40 -180 { lab=VIN}
N 0 -180 0 -70 { lab=VIN}
N 0 -70 40 -70 { lab=VIN}
N 80 -260 80 -210 { lab=#net1}
N 80 -180 110 -180 { lab=VDD}
N 80 -70 110 -70 { lab=VSS}
N 110 -70 110 40 { lab=VSS}
N 80 -40 80 10 { lab=#net2}
N 80 120 80 150 {
lab=VSS}
N 110 -290 110 -180 {
lab=VDD}
N 80 -290 110 -290 {
lab=VDD}
N 80 80 110 80 {
lab=VSS}
N 80 40 110 40 {
lab=VSS}
N 110 -330 110 -290 {
lab=VDD}
N 80 70 80 80 {
lab=VSS}
N -200 40 40 40 {lab=VCONT_D}
N 80 -128.75 80 -100 { lab=VOUT}
N 80 -128.75 486.25 -128.75 {lab=VOUT}
N 80 -150 80 -128.75 { lab=VOUT}
N 110 40 110 80 {
lab=VSS}
N 80 -330 80 -320 {lab=VDD}
N 20 -390 80 -390 {lab=VDD}
N 80 -330 110 -330 {lab=VDD}
N 80 -360 80 -330 {lab=VDD}
N -160 -260 -160 120 {lab=VSS}
N -160 120 80 120 {lab=VSS}
N 80 80 80 120 {
lab=VSS}
N -160 -360 -160 -320 {lab=VDD}
N -160 -360 80 -360 {lab=VDD}
N 80 -390 80 -360 {lab=VDD}
N -110 -290 40 -290 {lab=#net3}
N -200 -290 -190 -290 {lab=VCONT_D}
N -200 -290 -200 40 {lab=VCONT_D}
N -260 40 -200 40 {lab=VCONT_D}
N 10 150 80 150 {lab=VSS}
C {devices/iopin.sym} 18.75 150 2 0 {name=p13 sig_type=std_logic lab=VSS
}
C {devices/iopin.sym} 20 -390 2 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} 0 -131.25 0 0 {name=p4 lab=VIN
}
C {devices/opin.sym} 486.25 -128.75 0 0 {name=p5 lab=VOUT
}
C {devices/ipin.sym} -260 40 0 0 {name=p8 lab=VCONT}
C {sg13g2_pr/sg13_lv_nmos.sym} 60 40 0 0 {name=M5
l=0.13u
w=5u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 -290 0 0 {name=M6
l=0.13u
w=5u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 60 -180 0 0 {name=M2
l=0.13u
w=0.88u
ng=4
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 60 -70 0 0 {name=M1
l=0.13u
w=0.4u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {/home/designer/shared/UNIC-CASS-Aug25/others/inv_1_manual.sym} -160 -410 0 0 {name=x1}
