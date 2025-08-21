v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 2140 -1590 2180 -1590 { lab=VIN}
N 2140 -1590 2140 -1480 { lab=VIN}
N 2140 -1480 2180 -1480 { lab=VIN}
N 2220 -1540 2220 -1510 { lab=VOUT}
N 2220 -1670 2220 -1620 { lab=#net1}
N 2220 -1590 2250 -1590 { lab=VDD}
N 2220 -1480 2250 -1480 { lab=VSS}
N 2250 -1480 2250 -1370 { lab=VSS}
N 2220 -1450 2220 -1400 { lab=#net2}
N 2220 -1330 2220 -1290 {
lab=VSS}
N 2220 -1740 2220 -1730 {
lab=VDD}
N 2220 -1740 2250 -1740 {
lab=VDD}
N 2250 -1700 2250 -1590 {
lab=VDD}
N 2220 -1700 2250 -1700 {
lab=VDD}
N 2220 -1330 2250 -1330 {
lab=VSS}
N 2250 -1370 2250 -1330 {
lab=VSS}
N 2220 -1370 2250 -1370 {
lab=VSS}
N 2030 -1700 2180 -1700 {
lab=VN2}
N 1970 -1740 1970 -1730 {
lab=VDD}
N 1970 -1740 2220 -1740 {
lab=VDD}
N 1970 -1650 1970 -1400 {
lab=VN2}
N 2000 -1330 2220 -1330 {
lab=VSS}
N 1970 -1340 1970 -1330 {
lab=VSS}
N 1770 -1370 1930 -1370 {
lab=VN1}
N 1710 -1330 1970 -1330 {
lab=VSS}
N 1710 -1340 1710 -1330 {
lab=VSS}
N 1710 -1430 1710 -1400 {
lab=VN1}
N 1940 -1740 1970 -1740 {
lab=VDD}
N 1710 -1740 1710 -1730 {
lab=VDD}
N 1770 -1430 1770 -1370 {
lab=VN1}
N 1710 -1430 1770 -1430 {
lab=VN1}
N 1970 -1650 2030 -1650 {
lab=VN2}
N 2030 -1700 2030 -1650 {
lab=VN2}
N 1970 -1370 2000 -1370 {
lab=VSS}
N 2000 -1370 2000 -1330 {
lab=VSS}
N 1930 -1410 1930 -1370 {
lab=VN1}
N 1930 -1410 2180 -1410 {
lab=VN1}
N 2180 -1410 2180 -1370 {
lab=VN1}
N 1690 -1370 1710 -1370 {
lab=VSS}
N 1690 -1370 1690 -1330 {
lab=VSS}
N 1690 -1330 1710 -1330 {
lab=VSS}
N 1710 -1700 1740 -1700 {
lab=VDD}
N 1740 -1740 1740 -1700 {
lab=VDD}
N 1940 -1700 1970 -1700 {
lab=VDD}
N 1940 -1740 1940 -1700 {
lab=VDD}
N 2220 -1560 2220 -1540 { lab=VOUT}
N 2250 -1740 2250 -1700 {
lab=VDD}
N 2220 -1340 2220 -1330 {
lab=VSS}
N 1750 -1370 1770 -1370 {
lab=VN1}
N 1710 -1670 1710 -1430 {
lab=VN1}
N 1970 -1670 1970 -1650 {
lab=VN2}
N 2010 -1700 2030 -1700 {
lab=VN2}
N 1970 -1330 2000 -1330 {
lab=VSS}
N 1710 -1740 1740 -1740 {
lab=VDD}
N 1740 -1740 1940 -1740 {
lab=VDD}
N 1630 -1700 1670 -1700 {lab=VSS}
N 2220 -1820 2220 -1740 {lab=VDD}
N 1900 -1170 2040 -1170 {
lab=VOUT}
N 2220 -1540 2540 -1540 { lab=VOUT}
C {title-2.sym} -2770 -10 0 0 {name=l1 author="Santiago, Martin, Leonardo" rev=1.0 lock=false}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 1990 -1700 0 1 {name=M9
l=0.13u
w=0.26u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 1690 -1700 0 0 {name=M4
l=0.13u
w=0.26u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 2200 -1700 0 0 {name=M6
l=0.13u
w=2u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_pmos.sym} 2200 -1590 0 0 {name=M2
l=0.13u
w=4u
ng=1
m=1
rfmode=1
model=sg13_lv_pmos
spiceprefix=X
lab=VDD}
C {devices/lab_pin.sym} 1630 -1700 0 0 {name=p5 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2220 -1290 0 0 {name=p8 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2220 -1820 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2140 -1540 0 0 {name=p4 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 2540 -1540 1 0 {name=p7 sig_type=std_logic lab=VOUT}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 1730 -1370 0 1 {name=M5
l=0.13u
w=0.13u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 1950 -1370 0 0 {name=M8
l=0.13u
w=0.13u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 2200 -1370 0 0 {name=M7
l=0.13u
w=1.0u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
lab=VDD}
C {sg13g2_pr/sg13_lv_rf_nmos.sym} 2200 -1480 0 0 {name=M1
l=0.13u
w=2u
ng=1
m=1
rfmode=1
model=sg13_lv_nmos
spiceprefix=X
lab=VDD}
C {devices/code_shown.sym} 1380 -970 0 0 {name=CODE only_toplevel=false value="
.option scale=1e-6
.save v(vin) v(vout) 
.control
tran 1p 2000p 1p
plot v(vin) v(vout) v(vn1) v(vn2)


.endc

.measure tran tdelay
+ TRIG tran1.V(VIN) TD=0u VAL=1.2 RISE=1
+ TARG tran1.V(VOUT) TD=0u VAL=0.7 RISE=1


"}
C {devices/vsource.sym} 1210 -1120 0 0 {name=VDD value=1.2}
C {devices/vsource.sym} 1130 -1120 0 0 {name=VSS1 value=0}
C {devices/gnd.sym} 1130 -1090 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 1210 -1090 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} 1130 -1220 0 0 {name=VIN1 value="PULSE(0 1.2 0 0.1p 0.1p 71.5p 143p)" }
C {devices/lab_pin.sym} 1130 -1250 0 0 {name=p11 sig_type=std_logic lab=VIN}
C {devices/lab_pin.sym} 1130 -1190 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1130 -1150 0 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1210 -1150 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1960 -1170 1 0 {name=p18 sig_type=std_logic lab=VOUT}
C {devices/capa.sym} 2040 -1140 0 0 {name=C2
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 2040 -1110 0 0 {name=p19 sig_type=std_logic lab=VSS}
C {devices/code_shown.sym} 1380 -590 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif

.include /opt/pdks/ihp-sg13g2/libs.ref/sg13g2_stdcell/spice/sg13g2_stdcell.spice
"}
C {devices/lab_pin.sym} 2110 -1410 1 0 {name=p1 sig_type=std_logic lab=VN1}
C {devices/lab_pin.sym} 2110 -1700 1 0 {name=p2 sig_type=std_logic lab=VN2}
