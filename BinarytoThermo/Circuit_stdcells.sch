v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -100 -220 -100 90 {lab=#net1}
N -100 -220 -30 -220 {lab=#net1}
N -130 -160 -30 -160 {lab=#net2}
N -130 -40 -130 150 {lab=#net2}
N -270 -40 -130 -40 {lab=#net2}
N -280 -240 -100 -240 {lab=#net1}
N -100 -240 -100 -220 {lab=#net1}
N -130 -160 -130 -40 {lab=#net2}
N 120 -190 200 -190 {lab=s1t}
N 150 -40 200 -40 {lab=s2t}
N 150 280 190 280 {lab=s4t}
N -70 280 -40 280 {lab=vss}
N -70 300 -70 340 {lab=vss}
N -130 -40 -40 -40 {lab=#net2}
N -740 -240 -740 330 {lab=s4}
N -690 -40 -690 330 {lab=s3}
N -640 300 -640 330 {lab=vss}
N -740 -240 -470 -240 {lab=s4}
N -740 -340 -740 -240 {lab=s4}
N -690 -40 -460 -40 {lab=s3}
N -690 -340 -690 -40 {lab=s3}
N -590 -120 -590 330 {lab=vdd}
N -400 -320 -400 -290 {lab=vdd}
N -400 -320 -220 -320 {lab=vdd}
N -590 -340 -590 -320 {lab=vdd}
N -390 -120 -390 -90 {lab=vdd}
N -590 -320 -590 -120 {lab=vdd}
N -640 -340 -640 -150 {lab=vss}
N -640 -150 -640 50 {lab=vss}
N 20 -320 20 -260 {lab=vdd}
N -220 -320 -220 -100 {lab=vdd}
N -220 50 -220 220 {lab=vdd}
N -170 300 -70 300 {lab=vss}
N -640 50 -640 300 {lab=vss}
N -70 280 -70 300 {lab=vss}
N -640 300 -170 300 {lab=vss}
N -170 -120 -170 20 {lab=vss}
N -170 190 -170 300 {lab=vss}
N -640 -150 -400 -150 {lab=vss}
N -590 -320 -400 -320 {lab=vdd}
N -400 -190 -400 -150 {lab=vss}
N -590 -120 -390 -120 {lab=vdd}
N -640 50 -390 50 {lab=vss}
N -390 10 -390 50 {lab=vss}
N 30 -100 30 -90 {lab=vdd}
N -220 -100 30 -100 {lab=vdd}
N 30 10 30 20 {lab=vss}
N -170 20 30 20 {lab=vss}
N 30 220 30 230 {lab=vdd}
N -220 220 30 220 {lab=vdd}
N 30 330 30 340 {lab=vss}
N -70 340 30 340 {lab=vss}
N -220 -320 20 -320 {lab=vdd}
N -170 -120 20 -120 {lab=vss}
N 140 110 200 110 {lab=s3t}
N -220 50 30 50 {lab=vdd}
N -220 -100 -220 50 {lab=vdd}
N -170 190 30 190 {lab=vss}
N -170 20 -170 190 {lab=vss}
N -100 90 -40 90 {lab=#net1}
N -130 150 -40 150 {lab=#net2}
C {iopin.sym} -740 -340 3 0 {name=p1 lab=s4}
C {iopin.sym} -690 -340 3 0 {name=p2 lab=s3}
C {iopin.sym} 200 -190 0 0 {name=p3 lab=s1t}
C {iopin.sym} 200 -40 0 0 {name=p4 lab=s2t}
C {iopin.sym} 200 110 0 0 {name=p5 lab=s3t}
C {iopin.sym} 190 280 0 0 {name=p6 lab=s4t}
C {iopin.sym} -590 -340 3 0 {name=p7 lab=vdd}
C {iopin.sym} -640 -340 3 0 {name=p10 lab=vss}
C {/foss/designs/Termo_codePI/nand_prtt.sym} 60 120 0 0 {name=x3}
C {/foss/designs/Termo_codePI/nor_prtt.sym} 20 -190 0 0 {name=x1}
C {/foss/designs/Termo_codePI/inv_prtt.sym} -400 -240 0 0 {name=x2}
C {/foss/designs/Termo_codePI/inv_prtt.sym} 30 -40 0 0 {name=x4}
C {/foss/designs/Termo_codePI/inv_prtt.sym} -390 -40 0 0 {name=x5}
C {/foss/designs/Termo_codePI/inv_prtt.sym} 30 280 0 0 {name=x6}
