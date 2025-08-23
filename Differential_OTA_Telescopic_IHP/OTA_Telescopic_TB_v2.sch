v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 280 200 300 200 {lab=Vout1}
N 120 -140 300 -140 {lab=Vout2}
N 120 -100 320 -100 {lab=Vout1}
N 280 240 320 240 {lab=Vout2}
N 300 -140 480 -140 {lab=Vout2}
N 320 -100 420 -100 {lab=Vout1}
N 140 130 140 160 {lab=VDD}
N 190 130 190 160 {lab=VREF}
N 140 280 140 310 {lab=GND}
N 190 280 190 310 {lab=#net1}
N -340 50 -340 70 {lab=VN}
N -340 -10 -340 50 {lab=VN}
N -340 130 -340 150 {lab=GND}
N 20 -40 20 -20 {lab=GND}
N -740 200 -740 220 {lab=GND}
N -740 80 -740 140 {lab=VDD}
N 20 -240 20 -200 {lab=VDD}
N -650 200 -650 220 {lab=GND}
N -650 80 -650 140 {lab=VREF}
N 190 370 190 380 {lab=GND}
N 0 220 50 220 {lab=cmfb}
N 420 -100 420 -60 {lab=Vout1}
N 420 0 420 30 {lab=GND}
N 520 -100 520 -60 {lab=Vout2}
N 520 0 520 30 {lab=GND}
N 520 -140 520 -100 {lab=Vout2}
N 480 -140 520 -140 {lab=Vout2}
N -340 -110 -340 -90 {lab=#net2}
N -340 -180 -340 -170 {lab=VP}
N -80 -80 -80 -20 {lab=#net3}
N -340 -30 -340 -10 {lab=VN}
N -340 -200 -340 -180 {lab=VP}
N -80 -200 -80 -160 {lab=#net4}
N -20 220 -20 250 {lab=cmfb}
N -20 220 0 220 {lab=cmfb}
N -220 350 -220 380 {lab=#net5}
N -180 410 -160 410 {lab=#net5}
N -220 370 -160 370 {lab=#net5}
N -220 440 -220 460 {lab=GND}
N -270 290 -220 290 {lab=VDD}
N -230 410 -220 410 {lab=GND}
N -230 410 -230 450 {lab=GND}
N -230 450 -220 450 {lab=GND}
N -20 250 -20 270 {lab=cmfb}
N -100 270 -20 270 {lab=cmfb}
N 300 -100 300 50 {lab=Vout1}
N 360 -130 360 90 {lab=Vout2}
N 360 -140 360 -130 {lab=Vout2}
N 300 50 300 200 {lab=Vout1}
N 320 240 360 240 {lab=Vout2}
N 360 90 360 240 {lab=Vout2}
N -130 -20 -80 -20 {lab=#net3}
N -340 -20 -190 -20 {lab=VN}
N -340 -210 -340 -200 {lab=VP}
N -340 -210 -230 -210 {lab=VP}
N -170 -210 -80 -210 {lab=#net4}
N -80 -210 -80 -200 {lab=#net4}
N -120 -310 -120 -210 {lab=#net4}
N -120 -310 10 -310 {lab=#net4}
N 70 -310 180 -310 {lab=Vout2}
N 180 -310 180 -140 {lab=Vout2}
N -100 60 -10 60 {lab=#net3}
N -100 -20 -100 60 {lab=#net3}
N 50 60 180 60 {lab=Vout1}
N 180 -100 180 60 {lab=Vout1}
N 0 -40 0 -0 {lab=#net6}
N -50 -0 0 -0 {lab=#net6}
N -160 370 -160 410 {lab=#net5}
N 110 520 110 540 {lab=GND}
N 150 470 220 470 {lab=VREF}
N 300 200 300 320 {lab=Vout1}
N 360 240 360 310 {lab=Vout2}
N 300 380 300 400 {lab=#net7}
N 300 400 360 400 {lab=#net7}
N 360 380 360 400 {lab=#net7}
N 330 400 330 510 {lab=#net7}
N 150 510 330 510 {lab=#net7}
N 110 360 110 460 {lab=#net6}
N -140 350 110 360 {lab=#net6}
N -140 350 -130 0 {lab=#net6}
N -130 -0 -50 -0 {lab=#net6}
C {OTA_Telescopic_core.sym} 60 -260 0 0 {name=x1}
C {OTA_Telescopic_CMFB.sym} 130 220 0 1 {name=x2}
C {vsource.sym} -340 -140 0 0 {name=V6 value="0 AC 1" savecurrent=false}
C {vsource.sym} -340 100 0 0 {name=V7 value=1.33 savecurrent=false}
C {gnd.sym} -340 150 0 0 {name=l5 lab=GND}
C {vsource.sym} -340 -60 0 0 {name=V5 value="0 SIN(0 1m 1K)" savecurrent=false}
C {gnd.sym} 140 310 0 0 {name=l1 lab=GND}
C {gnd.sym} 20 -20 0 0 {name=l2 lab=GND}
C {vsource.sym} -740 170 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -740 220 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -740 80 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 20 -240 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 140 130 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {vsource.sym} -650 170 0 0 {name=V2 value=0.9 savecurrent=false}
C {gnd.sym} -650 220 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -650 80 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {lab_wire.sym} 190 130 0 0 {name=p5 sig_type=std_logic lab=VREF}
C {isource.sym} 190 340 0 0 {name=I0 value=1u}
C {gnd.sym} 190 380 0 0 {name=l6 lab=GND}
C {capa-2.sym} 420 -30 0 0 {name=C1
m=1
value=0.5p
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 420 30 0 0 {name=l10 lab=GND}
C {capa-2.sym} 520 -30 0 0 {name=C2
m=1
value=0.5p
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 520 30 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 520 -140 0 0 {name=p19 sig_type=std_logic lab=Vout2}
C {lab_wire.sym} 420 -100 0 0 {name=p18 sig_type=std_logic lab=Vout1}
C {devices/code.sym} -780 -280.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code.sym} -650 -280 0 0 {name=AC only_toplevel=true value="
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
write OTA_Telescopic_TB_v2.raw

.endc
"
}
C {devices/launcher.sym} -710 -120 0 0 {name=h3
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
C {code.sym} -530 -280 0 0 {name=save only_toplevel=false value="
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
.save @m.x2.xm1.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm2.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm4.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm5.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm6.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm7.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm8.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x2.xm0.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x2.xm3.msky130_fd_pr__pfet_01v8_lvt[id]

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
C {lab_wire.sym} 0 220 0 0 {name=p6 sig_type=std_logic lab=cmfb}
C {code.sym} -900 -280 0 0 {name=TRAN
only_toplevel=true
value="

.temp 27
.control

save all
tran 10n 3m
*write NMOS_diode_large_signal.raw

let Vout = v(Vout1)-v(Vout2)
let Vin = v(VP)-v(VN)

plot Vin Vout

.endc
"
spice_ignore=true}
C {lab_wire.sym} -300 -210 0 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_wire.sym} -220 -20 0 0 {name=p8 sig_type=std_logic lab=VN}
C {noconn.sym} -20 250 0 0 {name=l9}
C {isource.sym} -220 320 0 0 {name=I1 value=5u}
C {sky130_fd_pr/nfet_01v8_lvt.sym} -200 410 0 1 {name=M1
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
C {gnd.sym} -220 460 0 0 {name=l8 lab=GND}
C {lab_wire.sym} -250 290 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {res.sym} 40 -310 3 0 {name=R1
value=30k
footprint=1206
device=resistor
m=1}
C {res.sym} -200 -210 3 0 {name=R2
value=15k
footprint=1206
device=resistor
m=1}
C {res.sym} -160 -20 3 0 {name=R3
value=15k
footprint=1206
device=resistor
m=1}
C {res.sym} 20 60 3 0 {name=R4
value=30k
footprint=1206
device=resistor
m=1}
C {vcvs.sym} 110 490 0 1 {name=E1 value=3}
C {lab_wire.sym} 220 470 0 0 {name=p11 sig_type=std_logic lab=VREF}
C {res.sym} 300 350 0 0 {name=R5
value=500k
footprint=1206
device=resistor
m=1}
C {res.sym} 360 350 0 0 {name=R6
value=500k
footprint=1206
device=resistor
m=1}
C {gnd.sym} 110 540 0 0 {name=l11 lab=GND}
