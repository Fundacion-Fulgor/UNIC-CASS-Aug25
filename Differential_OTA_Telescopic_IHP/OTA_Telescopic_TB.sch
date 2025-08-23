v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 40 -40 220 -40 {lab=Vout2}
N 60 0 160 0 {lab=Vout1}
N -600 150 -600 170 {lab=#net1}
N -600 90 -600 150 {lab=#net1}
N -600 230 -600 250 {lab=GND}
N -60 60 -60 80 {lab=GND}
N -930 210 -930 230 {lab=GND}
N -930 90 -930 150 {lab=VDD}
N -840 210 -840 230 {lab=GND}
N -840 90 -840 150 {lab=VREF}
N 160 0 160 40 {lab=Vout1}
N 160 100 160 130 {lab=GND}
N 260 0 260 40 {lab=Vout2}
N 260 100 260 130 {lab=GND}
N 260 -40 260 0 {lab=Vout2}
N 220 -40 260 -40 {lab=Vout2}
N -600 -10 -600 10 {lab=#net2}
N -600 -80 -600 -70 {lab=#net3}
N -160 20 -160 80 {lab=VN}
N -600 70 -600 90 {lab=#net1}
N -600 -100 -600 -80 {lab=#net3}
N -160 -100 -160 -60 {lab=VP}
N -80 60 -80 120 {lab=cmfb}
N -55 190 -55 220 {lab=VREF}
N -105 170 -105 220 {lab=VDD}
N -115 170 -105 170 {lab=VDD}
N 35 260 145 260 {lab=Vout2}
N 145 200 145 260 {lab=Vout2}
N 35 300 255 300 {lab=Vout1}
N 255 220 255 300 {lab=Vout1}
N -105 340 -105 350 {lab=GND}
N -55 340 -55 360 {lab=#net4}
N -55 420 -55 430 {lab=GND}
N -265 280 -195 280 {lab=cmfb}
N -180 -100 -160 -100 {lab=VP}
N -180 80 -160 80 {lab=VN}
N -420 -100 -240 -100 {lab=VP}
N -600 -100 -480 -100 {lab=#net3}
N -600 80 -480 80 {lab=#net1}
N -420 80 -240 80 {lab=VN}
N -240 -100 -180 -100 {lab=VP}
N -240 80 -180 80 {lab=VN}
N -60 -270 -60 -100 {lab=VDD}
N -130 -140 -130 -120 {lab=#net5}
N -130 -120 -80 -120 {lab=#net5}
N -80 -120 -80 -100 {lab=#net5}
N -130 -260 -130 -200 {lab=VDD}
N 40 0 60 -0 {lab=Vout1}
C {OTA_Telescopic_core.sym} -20 -160 0 0 {name=x1}
C {vsource.sym} -600 -40 0 0 {name=V6 value="0 AC 1" savecurrent=false}
C {vsource.sym} -600 200 0 0 {name=V7 value=1.35 savecurrent=false}
C {gnd.sym} -600 250 0 0 {name=l5 lab=GND}
C {vsource.sym} -600 40 0 0 {name=V5 value="0 SIN(0 0.5m 1K)" savecurrent=false}
C {gnd.sym} -60 80 0 0 {name=l2 lab=GND}
C {vsource.sym} -930 180 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -930 230 0 0 {name=l3 lab=GND}
C {lab_wire.sym} -930 90 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {vsource.sym} -840 180 0 0 {name=V2 value=0.9 savecurrent=false}
C {gnd.sym} -840 230 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -840 90 0 0 {name=p4 sig_type=std_logic lab=VREF}
C {capa-2.sym} 160 70 0 0 {name=C1
m=1
value=0.5p
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 160 130 0 0 {name=l10 lab=GND}
C {capa-2.sym} 260 70 0 0 {name=C2
m=1
value=0.5p
footprint=1206
device=polarized_capacitor}
C {gnd.sym} 260 130 0 0 {name=l7 lab=GND}
C {lab_wire.sym} 260 -40 0 0 {name=p19 sig_type=std_logic lab=Vout2}
C {lab_wire.sym} 160 0 0 0 {name=p18 sig_type=std_logic lab=Vout1}
C {devices/code.sym} -1020 -180.390625 0 0 {name=TT_MODELS
only_toplevel=true
format="tcleval( @value )"
value="
** opencircuitdesign pdks install
.lib $::SKYWATER_MODELS/sky130.lib.spice tt

"
spice_ignore=false}
C {code.sym} -890 -180 0 0 {name=AC only_toplevel=true value="
.control
save all
 set color0 = white

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
C {devices/launcher.sym} -950 -20 0 0 {name=h3
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
C {code.sym} -770 -180 0 0 {name=save only_toplevel=false value="
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


.save @m.x1.xm13.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm14.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm15.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm16.msky130_fd_pr__nfet_01v8_lvt[id]
.save @m.x1.xm17.msky130_fd_pr__nfet_01v8_lvt[id]

.save @m.x1.xm18.msky130_fd_pr__pfet_01v8_lvt[id]
.save @m.x1.xm19.msky130_fd_pr__nfet_01v8_lvt[id]

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
C {code.sym} -1140 -180 0 0 {name=TRAN
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
C {lab_wire.sym} -320 -100 0 0 {name=p7 sig_type=std_logic lab=VP}
C {lab_wire.sym} -320 80 0 0 {name=p8 sig_type=std_logic lab=VN}
C {lab_wire.sym} -55 190 0 0 {name=p3 sig_type=std_logic lab=VREF}
C {lab_wire.sym} -115 170 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {gnd.sym} -105 350 0 0 {name=l6 lab=GND}
C {isource.sym} -55 390 0 0 {name=I0 value=5u}
C {lab_wire.sym} 255 220 0 0 {name=p6 sig_type=std_logic lab=Vout1}
C {lab_wire.sym} 145 200 0 0 {name=p9 sig_type=std_logic lab=Vout2}
C {OTA_Telescopic_CMFB.sym} -115 280 0 1 {name=x2}
C {gnd.sym} -55 430 0 0 {name=l8 lab=GND}
C {res.sym} -450 -100 1 0 {name=R5
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} -450 80 1 0 {name=R6
value=1k
footprint=1206
device=resistor
m=1}
C {lab_wire.sym} -80 120 0 0 {name=p14 sig_type=std_logic lab=cmfb}
C {lab_wire.sym} -220 280 0 0 {name=p15 sig_type=std_logic lab=cmfb}
C {noconn.sym} -265 280 0 0 {name=l1}
C {lab_wire.sym} -130 -260 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -60 -270 0 0 {name=p10 sig_type=std_logic lab=VDD}
C {isource.sym} -130 -170 0 0 {name=I1 value=5u}
