v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N -280 540 -240 540 {lab=VREF}
N 80 540 130 540 {lab=VCM}
N -200 500 -200 510 {lab=VP}
N -200 500 40 500 {lab=VP}
N 40 500 40 510 {lab=VP}
N -80 480 -80 500 {lab=VP}
N -200 570 -200 690 {lab=#net1}
N 40 570 40 690 {lab=CMFB}
N -160 720 -120 720 {lab=#net1}
N -120 660 -120 720 {lab=#net1}
N -200 660 -120 660 {lab=#net1}
N -40 720 -0 720 {lab=CMFB}
N -40 660 -40 720 {lab=CMFB}
N -40 660 40 660 {lab=CMFB}
N 40 750 40 760 {lab=VSS}
N -200 760 40 760 {lab=VSS}
N -200 750 -200 760 {lab=VSS}
N -210 720 -200 720 {lab=VSS}
N -210 720 -210 760 {lab=VSS}
N -210 760 -200 760 {lab=VSS}
N 40 720 50 720 {lab=VSS}
N 50 720 50 760 {lab=VSS}
N 40 760 50 760 {lab=VSS}
N -200 540 40 540 {lab=VDD}
N -80 450 -70 450 {lab=VDD}
N -70 400 -70 450 {lab=VDD}
N -80 400 -70 400 {lab=VDD}
N -80 400 -80 420 {lab=VDD}
N -560 400 -470 400 {lab=VDD}
N -470 400 -470 420 {lab=VDD}
N -470 400 -80 400 {lab=VDD}
N -430 450 -120 450 {lab=IBIAS}
N -480 450 -470 450 {lab=VDD}
N -480 400 -480 450 {lab=VDD}
N -550 550 -470 550 {lab=IBIAS}
N -470 480 -470 550 {lab=IBIAS}
N 40 660 100 660 {lab=CMFB}
N -550 760 -210 760 {lab=VSS}
N -400 450 -400 500 {lab=IBIAS}
N -470 500 -400 500 {lab=IBIAS}
C {iopin.sym} -560 400 0 1 {name=p1 lab=VDD}
C {iopin.sym} -550 550 0 1 {name=p3 lab=IBIAS}
C {iopin.sym} -550 760 0 1 {name=p2 lab=VSS}
C {ipin.sym} -280 540 0 0 {name=p9 lab=VREF}
C {ipin.sym} 130 540 0 1 {name=p10 lab=VCM}
C {opin.sym} 100 660 0 0 {name=p7 lab=CMFB}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -100 450 0 0 {name=M0
W=5
L=0.75
nf=1
mult=2*5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -220 540 0 0 {name=M1
W=10
L=0.35
nf=1
mult=40
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} 60 540 0 1 {name=M2
W=10
L=0.35
nf=1
mult=40
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8_lvt.sym} -450 450 0 1 {name=M5
W=5
L=0.75
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {lab_wire.sym} -40 500 0 0 {name=p4 sig_type=std_logic lab=VP}
C {lab_wire.sym} -80 540 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -180 720 0 1 {name=M3
W=65
L=0.6
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
C {sky130_fd_pr/nfet_01v8_lvt.sym} 20 720 0 0 {name=M4
W=65
L=0.6
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
