v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -40 -160 -0 -160 {lab=#net1}
N 0 -160 -0 -60 {lab=#net1}
N -70 70 -40 70 {lab=#net2}
N -40 40 -40 70 {lab=#net2}
N -0 40 -0 80 {lab=#net3}
N -270 -20 -50 -20 {lab=#net4}
N -270 40 -210 40 {lab=GND}
N -150 60 -130 60 {lab=GND}
N -150 -0 -50 -0 {lab=#net5}
N 50 -10 80 -10 {lab=V_out}
N 80 -10 80 -0 {lab=V_out}
C {/foss/designs/Propio/MUXdosAuno.sym} 170 -40 0 0 {name=x1}
C {vsource.sym} -70 100 0 0 {name=VSS value=0 savecurrent=false}
C {vsource.sym} -40 -130 0 0 {name=VDD value=1.2 savecurrent=false}
C {vsource.sym} -270 10 0 0 {name=VINA value=dc 0 ac 0 pulse(0 1.2 0 1p 1p 10p 20p) savecurrent=false}
C {vsource.sym} -150 30 0 0 {name=VINB value=dc 0 ac 0 pulse(0 1.2 5p 1p 1p 10p 20p) savecurrent=false}
C {vsource.sym} 0 110 0 0 {name=VS value=\{VS\} savecurrent=false}
C {gnd.sym} -70 130 0 0 {name=l1 lab=GND}
C {gnd.sym} -40 -100 0 0 {name=l2 lab=GND}
C {gnd.sym} -210 40 0 0 {name=l3 lab=GND}
C {gnd.sym} -130 60 0 0 {name=l4 lab=GND}
C {gnd.sym} 0 140 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 80 -10 2 0 {name=p1 sig_type=std_logic lab=V_out
}
C {netlist_not_shown.sym} -260 -200 0 0 {.lib /foss/pdks/ihp-sg13g2/libs.tech/ngspice/models/sg13_lv.lib tt

*.param para definir paso de VS
.step param VS 0 1.2 0.2


.tran 1p 200p

.save all

.control
  run
  set color0=white
  plot vina vinb vout
.endc
}
C {res.sym} 80 30 0 0 {name=R1
value=1000k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 80 60 0 0 {name=l6 lab=GND}
