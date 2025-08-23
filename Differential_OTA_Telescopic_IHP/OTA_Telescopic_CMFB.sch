v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -280 -20 -280 0 {lab=V1}
N -260 -20 -40 -20 {lab=V1}
N -40 -20 -40 -0 {lab=V1}
N -160 -30 -160 -20 {lab=V1}
N 120 -20 120 -0 {lab=V2}
N 120 -20 360 -20 {lab=V2}
N 360 -20 360 -0 {lab=V2}
N -160 -220 240 -220 {lab=VDD}
N -40 80 120 80 {lab=#net1}
N 120 60 120 80 {lab=#net1}
N 100 80 100 120 {lab=#net1}
N 400 30 440 30 {lab=VINN}
N 40 -50 40 -0 {lab=VREF}
N -690 -50 -690 20 {lab=IBIAS}
N -690 -20 -630 -20 {lab=IBIAS}
N -630 -80 -630 -20 {lab=IBIAS}
N -280 -20 -260 -20 {lab=V1}
N -360 30 -320 30 {lab=VINP}
N -720 90 -690 90 {lab=IBIAS}
N -420 380 -380 380 {lab=VSS}
N -690 20 -690 90 {lab=IBIAS}
N 250 -30 250 -20 {lab=V2}
N -160 -60 -160 -30 {lab=V1}
N 250 -60 250 -30 {lab=V2}
N -630 -110 -630 -80 {lab=IBIAS}
N -640 -110 -630 -110 {lab=IBIAS}
N -690 -80 -690 -50 {lab=IBIAS}
N -650 -110 -640 -110 {lab=IBIAS}
N -720 -220 -690 -220 {lab=VDD}
N -460 -220 -160 -220 {lab=VDD}
N -700 -110 -690 -110 {lab=VDD}
N -280 60 -280 200 {lab=CMFB}
N -280 200 -280 220 {lab=CMFB}
N 360 60 360 220 {lab=CMFB}
N 100 190 100 220 {lab=VSS}
N 100 160 110 160 {lab=VSS}
N 110 160 110 220 {lab=VSS}
N 100 120 100 130 {lab=#net1}
N 360 270 400 270 {lab=CMFB}
N -160 -220 -160 -140 {lab=VDD}
N -160 -80 -160 -60 {lab=V1}
N 250 -90 250 -60 {lab=V2}
N 250 -220 250 -150 {lab=VDD}
N 240 -220 250 -220 {lab=VDD}
N -40 60 -40 80 {lab=#net1}
N 120 30 250 30 {lab=VDD}
N 0 30 40 30 {lab=VREF}
N 40 0 40 30 {lab=VREF}
N -80 30 -40 30 {lab=VDD}
N 40 30 80 30 {lab=VREF}
N -380 380 -300 380 {lab=VSS}
N -120 30 -80 30 {lab=VDD}
N -280 30 -120 30 {lab=VDD}
N 250 30 360 30 {lab=VDD}
N -550 -220 -460 -220 {lab=VDD}
N -690 -220 -550 -220 {lab=VDD}
N -630 380 -420 380 {lab=VSS}
N -160 -110 -150 -110 {lab=VDD}
N -150 -220 -150 -110 {lab=VDD}
N 250 -120 260 -120 {lab=VDD}
N 260 -220 260 -120 {lab=VDD}
N 250 -220 260 -220 {lab=VDD}
N 120 -120 210 -120 {lab=IBIAS}
N -280 -110 -200 -110 {lab=IBIAS}
N -280 270 -280 300 {lab=CMFB}
N -280 270 90 270 {lab=CMFB}
N -280 220 -280 270 {lab=CMFB}
N 90 270 360 270 {lab=CMFB}
N 360 220 360 270 {lab=CMFB}
N 100 220 190 220 {lab=VSS}
N -300 330 -280 330 {lab=VSS}
N -300 330 -300 380 {lab=VSS}
N -300 380 -280 380 {lab=VSS}
N -280 360 -280 380 {lab=VSS}
N -240 330 -220 330 {lab=CMFB}
N -220 290 -220 330 {lab=CMFB}
N -280 290 -220 290 {lab=CMFB}
N -690 -220 -690 -140 {lab=VDD}
N -700 -220 -700 -110 {lab=VDD}
N -630 -110 -280 -110 {lab=IBIAS}
N 400 270 460 270 {lab=CMFB}
N 30 160 60 160 {lab=#net1}
N 30 110 30 160 {lab=#net1}
N 30 110 100 110 {lab=#net1}
C {iopin.sym} -720 -220 0 1 {name=p1 lab=VDD}
C {iopin.sym} -630 380 0 1 {name=p2 lab=VSS}
C {opin.sym} 460 270 0 0 {name=p7 lab=CMFB}
C {ipin.sym} 40 -50 0 0 {name=p5 lab=VREF}
C {iopin.sym} -720 90 0 1 {name=p3 lab=IBIAS}
C {ipin.sym} -360 30 0 0 {name=p9 lab=VINP}
C {ipin.sym} 440 30 0 1 {name=p10 lab=VINN}
C {lab_wire.sym} -200 -20 0 0 {name=p17 sig_type=std_logic lab=V1}
C {lab_wire.sym} 170 -20 0 0 {name=p11 sig_type=std_logic lab=V2}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -670 -110 0 1 {name=M0
W=15
L=0.85
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8_lvt.sym} 80 160 0 0 {name=M7
W=6
L=0.8
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
C {lab_wire.sym} -150 30 0 0 {name=p4 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 250 30 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -20 30 0 1 {name=M4
W=20
L=0.35
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 100 30 0 0 {name=M5
W=20
L=0.35
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -300 30 0 0 {name=M3
W=20
L=0.35
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 380 30 0 1 {name=M6
W=20
L=0.35
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -180 -110 0 0 {name=M1
W=15
L=0.85
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 230 -120 0 0 {name=M2
W=15
L=0.85
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {lab_wire.sym} 120 -120 0 0 {name=p12 sig_type=std_logic lab=IBIAS}
C {lab_wire.sym} 170 220 0 1 {name=p13 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -260 330 0 1 {name=M8
W=6
L=0.8
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8_lvt
spiceprefix=X
}
