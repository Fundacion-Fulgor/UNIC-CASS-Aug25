v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 680 -105 860 -105 {lab=Vout2}
N 680 -65 880 -65 {lab=Vout1}
N 860 -105 1040 -105 {lab=Vout2}
N 880 -65 980 -65 {lab=Vout1}
N 40 85 40 105 {lab=VN}
N 40 25 40 85 {lab=VN}
N 40 165 40 185 {lab=GND}
N 580 -5 580 15 {lab=GND}
N -460 145 -460 165 {lab=GND}
N -460 25 -460 85 {lab=VDD}
N 580 -205 580 -165 {lab=VDD}
N -370 145 -370 165 {lab=GND}
N -370 25 -370 85 {lab=VREF}
N 980 -65 980 -25 {lab=Vout1}
N 980 35 980 65 {lab=GND}
N 1080 -65 1080 -25 {lab=Vout2}
N 1080 35 1080 65 {lab=GND}
N 1080 -105 1080 -65 {lab=Vout2}
N 1040 -105 1080 -105 {lab=Vout2}
N 40 -75 40 -55 {lab=#net1}
N 40 -145 40 -135 {lab=VP}
N 480 -45 480 15 {lab=#net2}
N 40 5 40 25 {lab=VN}
N 40 -165 40 -145 {lab=VP}
N 480 -165 480 -125 {lab=#net3}
N 560 -5 560 55 {lab=cmfb}
N 585 235 585 265 {lab=VREF}
N 535 215 535 265 {lab=VDD}
N 525 215 535 215 {lab=VDD}
N 675 305 785 305 {lab=Vout1}
N 785 245 785 305 {lab=Vout1}
N 675 345 895 345 {lab=Vout2}
N 895 265 895 345 {lab=Vout2}
N 535 385 535 395 {lab=GND}
N 585 385 585 405 {lab=#net4}
N 585 465 585 475 {lab=GND}
N 375 325 445 325 {lab=cmfb}
N 460 -165 480 -165 {lab=#net3}
N 460 15 480 15 {lab=#net2}
N 40 -165 160 -165 {lab=VP}
N 40 15 160 15 {lab=VN}
C {OTA_Telescopic_core.sym} 620 -225 0 0 {name=x1}
C {vsource.sym} 40 -105 0 0 {name=V6 value="0 AC 1" savecurrent=false}
C {vsource.sym} 40 135 0 0 {name=V7 value=1.33 savecurrent=false}
C {gnd.sym} 40 185 0 0 {name=l5 lab=GND}
C {vsource.sym} 40 -25 0 0 {name=V5 value="0 SIN(0 0.5m 1K)" savecurrent=false}
C {gnd.sym} 580 15 0 0 {name=l2 lab=GND}
C {vsource.sym} -460 115 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -460 165 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -460 25 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 580 -205 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {vsource.sym} -370 115 0 0 {name=V2 value=0.9 savecurrent=false}
C {gnd.sym} -370 165 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -370 25 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {capa-2.sym} 980 5 0 0 {name=C1
m=1
value=0.5p
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 980 65 0 0 {name=l10 lab=GND}
C {capa-2.sym} 1080 5 0 0 {name=C2
m=1
value=0.5p
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 1080 65 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 1080 -105 0 0 {name=p19 sig_type=std_logic lab=Vout2}
C {lab_wire.sym} 980 -65 0 0 {name=p18 sig_type=std_logic lab=Vout1}
C {devices/code.sym} -550 -245.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code.sym} -420 -245 0 0 {name=AC only_toplevel=true value="
.control
save all

* AC simulation
ac dec 10 1 1T
let Av = db(v(Vout1)-v(Vout2))
meas ac Ao MAX Av
let ABW = Ao-3
meas ac BW WHEN Av=ABW
meas ac UGBW WHEN Av=0
let phase_vec = 180/pi*cph(v(Vout1)-v(Vout2))

* Phase margin (PM)
meas ac phase FIND phase_vec WHEN frequency=UGBW 
let PM = phase+180
print PM

* Gain margin (GM)
meas ac freq180 FIND frequency WHEN phase_vec=-180
meas ac gain FIND Av WHEN frequency=freq180
let GM = 0-gain
print GM
plot Av
plot phase_vec

write AC_OL.raw


*DC simulation

op
let vout_dc = v(Vout1)
print vout_dc
write OTA_Telescopic_TB.raw

.endc
"
}
C {devices/launcher.sym} -480 -85 0 0 {name=h3
descr="save, netlist & simulate"
tclcommand="xschem save; xschem netlist; xschem simulate"
value="
.param wx=5u lx=0.13u vbx=0
.save all
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[sid]
.save @n.xm1.nsg13_lv_nmos[sfl]

.control
set wr_vecnames
op
noise v(n) vg dec 10 1 1e11 1
noise v(n) vg lin  1 1 1 1
echo $plots
write noisetest_sg13g2_lv_nmos.raw noise1.all

setplot noise3
print onoise_spectrum
print onoise_n.xm1.nsg13_lv_nmos_flicker
print onoise_n.xm1.nsg13_lv_nmos_idid
print sqrt(@n.xm1.nsg13_lv_nmos[sfl])
print sqrt(@n.xm1.nsg13_lv_nmos[sid])
.endc
"}
C {code.sym} -300 -245 0 0 {name=save only_toplevel=false value="
.op

.save all
*OTA
.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x1.xm2.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm2.msky130_fd_pr__nfet_01v8_lvt[gm]

.save @m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm9.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm10.msky130_fd_pr__pfet_01v8_lvt[gm]

.save @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[id]

.save @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[vdssat]

*CMFB
.save @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm3.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm3.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm4.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm4.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm5.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm5.msky130_fd_pr__pfet_01v8_lvt[gm]
.save @m.x2.xm6.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm6.msky130_fd_pr__pfet_01v8_lvt[gm]

.save @m.x2.xm7.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x2.xm7.msky130_fd_pr__nfet_01v8_lvt[gm]
.save @m.x2.xm8.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x2.xm8.msky130_fd_pr__nfet_01v8_lvt[gm]



.control

let vdssat_M1 = @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[vdsat]
let vdssat_M3 = @m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[vdsat]
let vdssat_M5 = @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let vdssat_M7 = @m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let vdssat_M0 = @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[vdsat]

print vdssat_M1
print vdssat_M3
print vdssat_M5
print vdssat_M7
print vdssat_M0

let ro_M1 = 1/@m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gds]
let ro_M3 = 1/@m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[gds]
let ro_M5 = 1/@m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[gds]
let ro_M7 = 1/@m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[gds]
let ro_M0 = 1/@m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[gds]

print ro_M1
print ro_M3
print ro_M5
print ro_M7
print ro_M0

let gm_M1 = @m.x1.xm1.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm_M3 = @m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[gm]
let gm_M5 = @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm_M7 = @m.x1.xm7.msky130_fd_pr__pfet_01v8_lvt[gm]
let gm_M0 = @m.x1.xm0.msky130_fd_pr__nfet_01v8_lvt[gm]

print gm_M1
print gm_M3
print gm_M5
print gm_M7
print gm_M0

let gmb_M3 = @m.x1.xm3.msky130_fd_pr__nfet_01v8_lvt[gmbs]
let gmb_M5 = @m.x1.xm5.msky130_fd_pr__pfet_01v8_lvt[gmbs]

print gmb_M3
print gmb_M5


*CMFB

let x2_vdssat_M0 = @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[vdsat]
let x2_vth_M0 = @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[vth]

print x2_vdssat_M0
print x2_vth_M0

.endc

"
}
C {code.sym} -670 -245 0 0 {name=TRAN
only_toplevel=true
value="

.temp 27
.control

save all
tran 100n 3m
*write NMOS_diode_large_signal.raw

let Vout = v(Vout1)-v(Vout2)
let Vout1 = v(Vout1)
let Vout2 = v(Vout2)
let Vin = v(VP)-v(VN)

plot Vin Vout
plot Vout1 Vout2

.endc
"
spice_ignore=true}
C {lab_wire.sym} 90 -165 0 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_wire.sym} 120 15 0 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_wire.sym} 585 235 0 0 {name=p3 sig_type=std_logic lab=VREF}
C {lab_wire.sym} 525 215 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} 535 395 0 0 {name=l6 lab=GND}
C {isource.sym} 585 435 0 0 {name=I0 value=5u}
C {lab_wire.sym} 785 245 0 0 {name=p6 sig_type=std_logic lab=Vout1}
C {lab_wire.sym} 895 265 0 0 {name=p9 sig_type=std_logic lab=Vout2}
C {OTA_Telescopic_CMFB.sym} 525 325 0 1 {name=x2}
C {gnd.sym} 585 475 0 0 {name=l8 lab=GND}
C {res.sym} 190 -165 1 0 {name=R5
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 190 15 1 0 {name=R6
value=1k
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} 560 55 0 0 {name=p14 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} 420 325 0 0 {name=p15 sig_type=std_logic lab=cmfb}
C {noconn.sym} 375 325 0 0 {name=l1}
C {res.sym} 390 -165 1 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 400 15 1 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 550 -305 1 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
