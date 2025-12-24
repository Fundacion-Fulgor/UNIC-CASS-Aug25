v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -100 -150 -70 -150 {lab=in}
N -100 -100 -100 -50 {lab=in}
N -100 -50 -70 -50 {lab=in}
N -30 -100 -30 -80 {lab=out}
N -30 -200 -30 -180 {lab=vdd}
N -10 -200 70 -200 {lab=vdd}
N -30 -150 -10 -150 {lab=vdd}
N -10 -200 -10 -150 {lab=vdd}
N -30 -200 -10 -200 {lab=vdd}
N 0 -0 80 0 {lab=vss}
N -30 -20 -30 0 {lab=vss}
N -30 -100 80 -100 {lab=out}
N -30 -120 -30 -100 {lab=out}
N -120 -100 -100 -100 {lab=in}
N -100 -150 -100 -100 {lab=in}
N -30 -50 0 -50 {lab=vss}
N 0 -50 0 -0 {lab=vss}
N -30 0 0 -0 {lab=vss}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/nfet_01v8.sym} -50 -50 0 0 {name=M1
W=0.45
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/foss/pdks/sky130A/libs.tech/xschem/sky130_fd_pr/pfet_01v8.sym} -50 -150 0 0 {name=M2
W=0.45
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {iopin.sym} 70 -200 0 0 {name=p1 lab=vdd}
C {iopin.sym} 80 0 0 0 {name=p2 lab=vss}
C {iopin.sym} 80 -100 0 0 {name=p3 lab=out}
C {iopin.sym} -120 -100 2 0 {name=p4 lab=in}
