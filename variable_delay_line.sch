v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 120 -10 300 -10 {lab=VCONT}
N -60 -110 -60 -10 {lab=VCONT}
N -60 -10 120 -10 {lab=VCONT}
N 120 -110 120 -10 {lab=VCONT}
N -200 -160 -140 -160 {lab=VIN}
N 100 -305 280 -305 {lab=VDD}
N 280 -305 280 -210 {lab=VDD}
N 100 -305 100 -210 {lab=VDD}
N -80 -305 100 -305 {lab=VDD}
N -80 -305 -80 -210 {lab=VDD}
N -145 -305 -80 -305 {lab=VDD}
N 80 -80 260 -80 {lab=VSS}
N 260 -110 260 -80 {lab=VSS}
N 80 -110 80 -80 {lab=VSS}
N -100 -110 -100 -80 {lab=VSS}
N -140 -80 -100 -80 {lab=VSS}
N -100 -80 80 -80 {lab=VSS}
N -20 -160 42.5 -160 {lab=#net1}
N 720 -10 900 -10 {lab=VCONT}
N 900 -110 900 -10 {lab=VCONT}
N 540 -110 540 -10 {lab=VCONT}
N 720 -110 720 -10 {lab=VCONT}
N 540 -10 720 -10 {lab=VCONT}
N 700 -305 880 -305 {lab=VDD}
N 700 -305 700 -210 {lab=VDD}
N 520 -305 700 -305 {lab=VDD}
N 520 -305 520 -210 {lab=VDD}
N 680 -80 860 -80 {lab=VSS}
N 680 -110 680 -80 {lab=VSS}
N 500 -110 500 -80 {lab=VSS}
N 500 -80 680 -80 {lab=VSS}
N 280 -305 520 -305 {lab=VDD}
N 300 -10 540 -10 {lab=VCONT}
N 300 -110 300 -10 {lab=VCONT}
N 260 -80 500 -80 {lab=VSS}
N -120 -10 -60 -10 {lab=VCONT}
N 880 -305 880 -210 {lab=VDD}
N 880 -310 880 -305 {lab=VDD}
N 860 -110 860 -80 {lab=VSS}
N 760 -160 820 -160 {lab=#net2}
N 940 -160 990 -160 {lab=VOUT}
N 580 -160 640 -160 {lab=#net3}
N 340 -160 460 -160 {lab=#net4}
N 160 -160 220 -160 {lab=#net5}
C {devices/iopin.sym} -138.75 -80 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} -143.75 -305 2 0 {name=p17 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} -200 -160 0 0 {name=p4 lab=VIN}
C {devices/opin.sym} 990 -160 0 0 {name=p5 lab=VOUT}
C {devices/ipin.sym} -120 -10 0 0 {name=p8 lab=VCONT}
C {variable_delay.sym} -80 -160 0 0 {name=x1}
C {variable_delay.sym} 100 -160 0 0 {name=x2}
C {variable_delay.sym} 280 -160 0 0 {name=x3}
C {variable_delay.sym} 520 -160 0 0 {name=x4}
C {variable_delay.sym} 700 -160 0 0 {name=x5}
C {variable_delay.sym} 880 -160 0 0 {name=x6}
