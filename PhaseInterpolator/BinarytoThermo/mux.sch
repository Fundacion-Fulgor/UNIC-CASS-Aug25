v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N -30 -90 80 -90 {lab=#net1}
N -410 130 -410 260 {lab=i_control}
N -470 60 -470 260 {lab=i_B}
N -530 190 -530 260 {lab=i_A}
N -410 -90 -220 -90 {lab=i_control}
N -410 -190 -410 -90 {lab=i_control}
N -350 240 -350 260 {lab=i_vss}
N -290 80 -290 260 {lab=i_vdd}
N -150 -170 -150 -140 {lab=i_vdd}
N -290 -190 -290 -170 {lab=i_vdd}
N -150 -40 -150 -0 {lab=i_vss}
N -350 -0 -150 0 {lab=i_vss}
N -350 -190 -350 -0 {lab=i_vss}
N -50 -30 80 -30 {lab=i_B}
N -50 -30 -50 60 {lab=i_B}
N -470 60 -50 60 {lab=i_B}
N -470 -190 -470 60 {lab=i_B}
N -410 130 80 130 {lab=i_control}
N -410 -90 -410 130 {lab=i_control}
N -530 190 80 190 {lab=i_A}
N -530 -190 -530 190 {lab=i_A}
N 150 -170 150 -130 {lab=i_vdd}
N -150 -170 150 -170 {lab=i_vdd}
N -290 -170 -150 -170 {lab=i_vdd}
N -150 10 150 10 {lab=i_vss}
N -150 0 -150 10 {lab=i_vss}
N 150 80 150 90 {lab=i_vdd}
N -290 80 150 80 {lab=i_vdd}
N -290 -170 -290 80 {lab=i_vdd}
N 150 230 150 240 {lab=i_vss}
N -350 240 150 240 {lab=i_vss}
N -350 -0 -350 240 {lab=i_vss}
N 260 -70 290 -70 {lab=#net2}
N 290 -70 290 20 {lab=#net2}
N 290 20 330 20 {lab=#net2}
N 260 150 290 150 {lab=#net3}
N 290 80 290 150 {lab=#net3}
N 290 80 330 80 {lab=#net3}
N 400 120 400 240 {lab=i_vss}
N 150 240 400 240 {lab=i_vss}
N 400 -170 400 -20 {lab=i_vdd}
N 150 -170 400 -170 {lab=i_vdd}
N 510 40 560 40 {lab=o_out}
C {/foss/designs/Termo_codePI/inv_prtt.sym} -150 -90 0 0 {name=x1}
C {/foss/designs/Termo_codePI/nand_prtt.sym} 180 -60 0 0 {name=x2}
C {/foss/designs/Termo_codePI/nand_prtt.sym} 180 160 0 0 {name=x3}
C {/foss/designs/Termo_codePI/nand_prtt.sym} 430 50 0 0 {name=x4}
C {iopin.sym} -410 -190 3 0 {name=p1 lab=i_control}
C {iopin.sym} -470 -190 3 0 {name=p2 lab=i_B}
C {iopin.sym} -530 -190 3 0 {name=p3 lab=i_A}
C {iopin.sym} -350 -190 3 0 {name=p4 lab=i_vss}
C {iopin.sym} -290 -190 3 0 {name=p5 lab=i_vdd}
C {iopin.sym} 560 40 0 0 {name=p6 lab=o_out}
