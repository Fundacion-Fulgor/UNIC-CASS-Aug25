v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
L 4 120 -400 120 -80 {}
L 4 120 -400 670 -400 {}
L 4 670 -400 670 -90 {}
L 4 120 -80 120 -60 {}
L 4 120 -60 670 -60 {}
L 4 670 -90 670 -60 {}
N 528.75 -380 528.75 -270.625 {lab=VDD}
N 259.375 -140 530 -140 {lab=VSS}
N 279.375 -380 528.75 -380 {lab=VDD}
N 100 -90 299.375 -90 {lab=#net1}
N 259.375 -180 259.375 -140 {lab=VSS}
N 530 -190 530 -140 {lab=VSS}
N 650 -230 715.625 -230 {lab=VOUT}
N 103.4375 -140 259.375 -140 {lab=VSS}
N 344.375 -230 350 -230 {lab=va}
N 299.375 -180.78125 299.375 -90 {lab=#net1}
N 92.5 -230 220 -230 {lab=VIN}
N 279.375 -380 279.375 -279.375 {lab=VDD}
N 102.5 -380 279.375 -380 {lab=VDD}
N 344.375 -279.375 344.375 -230 {lab=va}
N 337.5 -230 344.375 -230 {lab=va}
C {devices/iopin.sym} 103.4375 -140 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} 105 -380 2 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} 92.5 -230 0 0 {name=p4 lab=VIN}
C {devices/opin.sym} 715.625 -230 0 0 {name=p5 lab=VOUT}
C {devices/ipin.sym} 98.75 -90 0 0 {name=p8 lab=VCONT}
C {/foss/designs/UNIC-CASS-Aug25/sym/delay_variable/delay_variable.sym} 279.375 -230 0 0 {name=x1
}
C {/foss/designs/UNIC-CASS-Aug25/sym/large_delay_vto1p1/large_delay_vto1p1.sym} 470 -230 0 0 {name=x9}
C {devices/lab_pin.sym} 344.375 -278.75 1 0 {name=p1 sig_type=std_logic lab=va}
