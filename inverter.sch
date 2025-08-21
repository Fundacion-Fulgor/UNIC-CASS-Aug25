v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 260 -250 300 -250 { lab=VIN}
N 260 -250 260 -140 { lab=VIN}
N 260 -140 300 -140 { lab=VIN}
N 340 -330 340 -280 { lab=#net1}
N 340 -250 370 -250 { lab=VDD}
N 340 -140 370 -140 { lab=VSS}
N 370 -140 370 -30 { lab=VSS}
N 340 -110 340 -60 { lab=#net2}
N 340 10 340 50 {
lab=VSS}
N 340 -400 340 -390 {
lab=VDD}
N 340 -400 370 -400 {
lab=VDD}
N 370 -360 370 -250 {
lab=VDD}
N 340 -360 370 -360 {
lab=VDD}
N 340 10 370 10 {
lab=VSS}
N 370 -30 370 10 {
lab=VSS}
N 340 -30 370 -30 {
lab=VSS}
N 150 -360 300 -360 {
lab=VN2}
N 90 -400 90 -390 {
lab=VDD}
N 90 -400 340 -400 {
lab=VDD}
N 90 -310 90 -60 {
lab=VN2}
N 120 10 340 10 {
lab=VSS}
N 90 0 90 10 {
lab=VSS}
N 60 -400 90 -400 {
lab=VDD}
N 90 -310 150 -310 {
lab=VN2}
N 150 -360 150 -310 {
lab=VN2}
N 90 -30 120 -30 {
lab=VSS}
N 120 -30 120 10 {
lab=VSS}
N 50 -70 50 -30 {
lab=Vctrl}
N 50 -70 300 -70 {
lab=Vctrl}
N 300 -70 300 -30 {
lab=Vctrl}
N 60 -360 90 -360 {
lab=VDD}
N 60 -400 60 -360 {
lab=VDD}
N 340 -200 340 -170 { lab=VOUT}
N 370 -400 370 -360 {
lab=VDD}
N 340 0 340 10 {
lab=VSS}
N 90 -330 90 -310 {
lab=VN2}
N 130 -360 150 -360 {
lab=VN2}
N 90 10 120 10 {
lab=VSS}
N 340 -480 340 -400 {lab=VDD}
N 0 -30 50 -30 {lab=Vctrl}
N 340 -200 490 -200 {lab=VOUT}
N 340 -220 340 -200 { lab=VOUT}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 110 -360 0 1 {name=M9
l=0.26u
w=0.52u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 320 -360 0 0 {name=M6
l=0.26u
w=6u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 320 -250 0 0 {name=M2
l=0.26u
w=8u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
lab=VDD}
C {devices/lab_pin.sym} 340 50 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 340 -480 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 260 -200 0 0 {name=p4 sig_type=std_logic lab=VIN}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 70 -30 0 0 {name=M8
l=0.26u
w=0.26u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 320 -30 0 0 {name=M7
l=0.26u
w=3.0u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 320 -140 0 0 {name=M1
l=0.26u
w=4u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
lab=VDD}
C {devices/lab_pin.sym} 0 -30 1 0 {name=p1 sig_type=std_logic lab=Vctrl}
C {devices/lab_pin.sym} 130 -310 1 0 {name=p2 sig_type=std_logic lab=VN2}
C {devices/lab_pin.sym} 490 -200 1 0 {name=p9 sig_type=std_logic lab=VOUT}
C {devices/vsource.sym} -290 -220 0 0 {name=VDD value=1.2}
C {devices/vsource.sym} -370 -220 0 0 {name=VSS1 value=0}
C {devices/gnd.sym} -370 -190 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} -290 -190 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -370 -320 0 0 {name=VIN1 value="PULSE(0 1.2 0 0.1p 0.1p 71.5p 143p)" }
C {devices/lab_pin.sym} -370 -350 0 0 {name=p11 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} -370 -290 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -370 -250 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} -290 -250 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/vsource.sym} -490 -320 0 0 {name=VDD1 value=1.2}
C {devices/gnd.sym} -490 -290 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -490 -350 0 0 {name=p3 sig_type=std_logic lab=Vctrl}
