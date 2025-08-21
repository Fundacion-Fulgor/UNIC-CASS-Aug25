v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 960 -420 1070 -420 {lab=VOUT}
N 960 -420 960 -220 {lab=VOUT}
N 580 -630 660 -630 {lab=#net1}
N 580 -220 660 -220 {lab=#net2}
N 710 -710 710 -670 {lab=VDD}
N 710 -180 710 -140 {lab=VSS}
N 710 -590 710 -550 {lab=VSS}
N 710 -300 710 -260 {lab=VDD}
N 780 -630 960 -630 {lab=VOUT}
N 780 -220 960 -220 {lab=VOUT}
N 200 -740 240 -740 {lab=VINI}
N 200 -720 240 -720 {lab=VINIB}
N 200 -540 240 -540 {lab=VINQ}
N 200 -520 240 -520 {lab=VINQ}
N 290 -620 290 -580 {lab=VDD}
N 250 -680 250 -640 {lab=VSS}
N 250 -480 250 -440 {lab=VSS}
N 290 -820 290 -780 {lab=VDD}
N 290 -680 290 -640 {lab=VS1}
N 290 -480 290 -440 {lab=VS2}
N 490 -580 490 -540 {lab=VSS}
N 530 -720 530 -680 {lab=VDD}
N 530 -580 530 -540 {lab=VS1}
N 400 -640 480 -640 {lab=#net3}
N 400 -620 480 -620 {lab=#net4}
N 400 -730 400 -640 {lab=#net3}
N 340 -730 400 -730 {lab=#net3}
N 340 -530 400 -530 {lab=#net4}
N 400 -620 400 -530 {lab=#net4}
N 200 -330 240 -330 {lab=#net5}
N 200 -310 240 -310 {lab=#net6}
N 200 -130 240 -130 {lab=#net7}
N 200 -110 240 -110 {lab=#net8}
N 290 -210 290 -170 {lab=VDD}
N 250 -270 250 -230 {lab=VSS}
N 250 -70 250 -30 {lab=VSS}
N 290 -410 290 -370 {lab=VDD}
N 290 -270 290 -230 {lab=VS1}
N 290 -70 290 -30 {lab=VS2}
N 490 -170 490 -130 {lab=VSS}
N 530 -310 530 -270 {lab=VDD}
N 530 -170 530 -130 {lab=VS1}
N 400 -230 480 -230 {lab=#net9}
N 400 -210 480 -210 {lab=#net10}
N 400 -320 400 -230 {lab=#net9}
N 340 -320 400 -320 {lab=#net9}
N 340 -120 400 -120 {lab=#net10}
N 400 -210 400 -120 {lab=#net10}
N 960 -630 960 -420 {lab=VOUT}
N 290 -1020 290 -980 {lab=VDD}
N 290 -900 290 -860 {lab=VSS}
N 200 -940 240 -940 {lab=VINI}
N 360 -940 400 -940 {lab=VINIB}
N 620 -1020 620 -980 {lab=VDD}
N 620 -900 620 -860 {lab=VSS}
N 530 -940 570 -940 {lab=VINQ}
N 690 -940 730 -940 {lab=VINQB}
C {iopin.sym} 710 -710 0 0 {name=p1 lab=VDD}
C {opin.sym} 1070 -420 0 0 {name=p2 lab=VOUT}
C {ipin.sym} 200 -940 0 0 {name=p3 lab=VINI}
C {ipin.sym} 530 -940 0 0 {name=p4 lab=VINQ}
C {inv.sym} 620 -490 0 0 {name=x1}
C {inv.sym} 620 -80 0 0 {name=x2}
C {iopin.sym} 710 -140 0 0 {name=p5 lab=VSS}
C {lab_wire.sym} 710 -300 2 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 710 -550 2 0 {name=p7 sig_type=std_logic lab=VSS}
C {res.sym} 1470 -630 3 0 {name=R1
value=250
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {res.sym} 1595 -620 3 0 {name=R2
value=250
footprint=1206
device=resistor
m=1
spice_ignore=true}
C {MUX_2_1.sym} 210 -450 0 0 {name=x3}
C {MUX_2_1.sym} 210 -650 0 0 {name=x4}
C {lab_wire.sym} 200 -740 0 0 {name=p8 sig_type=std_logic lab=VINI}
C {lab_wire.sym} 200 -720 0 0 {name=p9 sig_type=std_logic lab=VINIB}
C {lab_wire.sym} 200 -540 0 0 {name=p10 sig_type=std_logic lab=VINQ}
C {lab_wire.sym} 200 -520 0 0 {name=p11 sig_type=std_logic lab=VINQB}
C {lab_wire.sym} 290 -620 2 0 {name=p12 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 250 -640 2 0 {name=p13 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 250 -440 2 0 {name=p14 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 290 -820 2 0 {name=p15 sig_type=std_logic lab=VDD}
C {ipin.sym} 1240 -680 0 0 {name=p16 lab=VS1}
C {lab_wire.sym} 290 -640 2 0 {name=p17 sig_type=std_logic lab=VS1}
C {lab_wire.sym} 290 -440 2 0 {name=p18 sig_type=std_logic lab=VS2}
C {ipin.sym} 1240 -660 0 0 {name=p19 lab=VS2}
C {MUX_2_1.sym} 450 -550 0 0 {name=x5}
C {lab_wire.sym} 490 -540 2 0 {name=p20 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 530 -720 2 0 {name=p21 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 530 -540 2 0 {name=p22 sig_type=std_logic lab=VS1}
C {MUX_2_1.sym} 210 -40 0 0 {name=x6}
C {MUX_2_1.sym} 210 -240 0 0 {name=x7}
C {lab_wire.sym} 290 -210 2 0 {name=p27 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 250 -230 2 0 {name=p28 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 250 -30 2 0 {name=p29 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 290 -410 2 0 {name=p30 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 290 -230 2 0 {name=p31 sig_type=std_logic lab=VS1}
C {lab_wire.sym} 290 -30 2 0 {name=p32 sig_type=std_logic lab=VS2}
C {MUX_2_1.sym} 450 -140 0 0 {name=x8}
C {lab_wire.sym} 490 -130 2 0 {name=p33 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 530 -310 2 0 {name=p34 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 530 -130 2 0 {name=p35 sig_type=std_logic lab=VS1}
C {iopin.sym} 290 -1020 0 0 {name=p36 lab=VDD}
C {inv.sym} 200 -800 0 0 {name=x9}
C {lab_wire.sym} 290 -860 2 0 {name=p37 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 400 -940 2 0 {name=p38 sig_type=std_logic lab=VINIB}
C {iopin.sym} 620 -1020 0 0 {name=p39 lab=VDD}
C {inv.sym} 530 -800 0 0 {name=x10}
C {lab_wire.sym} 620 -860 2 0 {name=p40 sig_type=std_logic lab=VSS}
C {lab_wire.sym} 730 -940 2 0 {name=p41 sig_type=std_logic lab=VINQB}
C {lab_wire.sym} 200 -330 0 0 {name=p23 sig_type=std_logic lab=VINI}
C {lab_wire.sym} 200 -310 0 0 {name=p24 sig_type=std_logic lab=VINIB}
C {lab_wire.sym} 200 -130 0 0 {name=p25 sig_type=std_logic lab=VINQ}
C {lab_wire.sym} 200 -110 0 0 {name=p26 sig_type=std_logic lab=VINQB}
