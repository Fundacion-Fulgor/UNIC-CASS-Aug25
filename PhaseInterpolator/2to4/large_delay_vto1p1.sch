v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 70 70 230 70 {lab=VIN}
N 310 70 410 70 {lab=VOUT}
C {devices/lab_pin.sym} 90 -70 0 0 {name=p6 sig_type=std_logic lab=VIN,n1,n2,n3
spice_ignore=true}
C {devices/lab_pin.sym} 330 -70 0 1 {name=p7 sig_type=std_logic lab=n1,n2,n3,VOUT
spice_ignore=true}
C {devices/iopin.sym} 260 -170 2 0 {name=p4 lab=VIN}
C {devices/iopin.sym} 270 -130 2 0 {name=p5 lab=VOUT}
C {devices/iopin.sym} 170 -170 2 0 {name=p1 lab=VCC}
C {devices/iopin.sym} 170 -130 2 0 {name=p2 lab=VSS}
C {sg13g2_stdcells/sg13g2_dlygate4sd3_1.sym} 190 -70 0 0 {name=x1[0:3] VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {devices/lab_pin.sym} 80 70 0 0 {name=p3 sig_type=std_logic lab=VIN}
C {sg13g2_stdcells/sg13g2_dlygate4sd2_1.sym} 270 70 0 0 {name=x1 VDD=VCC VSS=VSS prefix=sg13g2_ }
C {sg13g2_stdcells/sg13g2_dlygate4sd3_1.sym} 1030 -30 0 0 {name=x5 VDD=VCC VSS=VSS prefix=sg13g2_ spice_ignore=true}
C {devices/lab_pin.sym} 405 70 0 1 {name=p8 sig_type=std_logic lab=VOUT}
