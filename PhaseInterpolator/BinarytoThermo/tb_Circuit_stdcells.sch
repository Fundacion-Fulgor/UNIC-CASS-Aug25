v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 150 -30 180 -30 {lab=vo_s1t}
N 180 -230 180 -30 {lab=vo_s1t}
N 150 -10 220 -10 {lab=vo_s2t}
N 220 -80 220 -10 {lab=vo_s2t}
N 150 10 220 10 {lab=vo_s3t}
N 150 30 180 30 {lab=vo_s4t}
N 590 -230 660 -230 {lab=avss}
N 660 80 660 230 {lab=avss}
N 590 230 660 230 {lab=avss}
N 590 80 660 80 {lab=avss}
N 590 -80 660 -80 {lab=avss}
N 660 -230 660 -80 {lab=avss}
N 805 -160 805 -140 {lab=GND}
N 805 -240 805 -220 {lab=avss}
N 940 -165 940 -145 {lab=avss}
N 805 70 805 90 {lab=avss}
N 805 -10 805 10 {lab=vs3}
N 810 280 810 300 {lab=avss}
N 810 200 810 220 {lab=vs4}
N 660 -20 660 80 {lab=avss}
N 660 -20 680 -20 {lab=avss}
N 660 -80 660 -20 {lab=avss}
N 0 -120 0 -100 {lab=avdd}
N -170 -40 -150 -40 {lab=vs4}
N 215 -240 215 -230 {lab=vo_s1t}
N 245 -95 245 -80 {lab=vo_s2t}
N 245 65 245 80 {lab=vo_s3t}
N 220 220 220 230 {lab=vo_s4t}
N 180 230 220 230 {lab=vo_s4t}
N -170 40 -150 40 {lab=vs3}
N 220 10 220 80 {lab=vo_s3t}
N 180 30 180 230 {lab=vo_s4t}
N 0 100 0 120 {lab=avss}
N 215 -230 290 -230 {lab=vo_s1t}
N 180 -230 215 -230 {lab=vo_s1t}
N 245 -80 290 -80 {lab=vo_s2t}
N 220 -80 245 -80 {lab=vo_s2t}
N 245 80 290 80 {lab=vo_s3t}
N 220 80 245 80 {lab=vo_s3t}
N 220 230 290 230 {lab=vo_s4t}
N 360 310 400 310 {lab=avss}
N 360 150 400 150 {lab=avss}
N 360 -10 390 -10 {lab=avss}
N 360 -160 400 -160 {lab=avss}
N 335 -310 360 -310 {lab=avdd}
N 360 -310 360 -280 {lab=avdd}
N 325 -150 360 -150 {lab=avdd}
N 360 -150 360 -130 {lab=avdd}
N 325 10 360 10 {lab=avdd}
N 360 10 360 30 {lab=avdd}
N 325 160 360 160 {lab=avdd}
N 360 160 360 180 {lab=avdd}
N 480 -230 530 -230 {lab=#net1}
N 480 80 530 80 {lab=#net2}
N 480 230 530 230 {lab=#net3}
N 480 -80 530 -80 {lab=#net4}
N 940 -270 940 -220 {lab=avdd}
N 360 -180 360 -160 {lab=avss}
N 360 -30 360 -10 {lab=avss}
N 360 130 360 150 {lab=avss}
N 360 280 360 310 {lab=avss}
C {capa.sym} 560 -230 3 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 560 -80 3 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 560 80 3 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {capa.sym} 560 230 3 0 {name=C4
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {vsource.sym} 805 -190 0 0 {name=V1 value=DC\{vss\} savecurrent=false}
C {gnd.sym} 805 -140 0 0 {name=l1 lab=GND}
C {lab_pin.sym} 805 -240 1 0 {name=p1 sig_type=std_logic lab=avss}
C {vsource.sym} 940 -195 0 0 {name=V2 value=DC\{vdd\} savecurrent=false}
C {lab_pin.sym} 335 -310 0 0 {name=p2 sig_type=std_logic lab=avdd}
C {lab_pin.sym} 940 -145 3 0 {name=p3 sig_type=std_logic lab=avss}
C {vsource.sym} 805 40 0 0 {name=V3 value="DC\{a\} PULSE(0 \{vdd\} 0.0 1p 1p \{2*Tclk\} \{4*Tclk\}) AC 0" savecurrent=false}
C {lab_pin.sym} 805 -10 1 0 {name=p4 sig_type=std_logic lab=vs3}
C {lab_pin.sym} 805 90 3 0 {name=p5 sig_type=std_logic lab=avss}
C {vsource.sym} 810 250 0 0 {name=V4 value="DC=\{vdd*c+1.2*d\} PULSE(0 \{vdd\} 0.0 1p 1p \{Tclk\} \{2*Tclk\}) AC 0" savecurrent=false}
C {lab_pin.sym} 810 200 1 0 {name=p6 sig_type=std_logic lab=vs4}
C {lab_pin.sym} 810 300 3 0 {name=p7 sig_type=std_logic lab=avss}
C {lab_pin.sym} 680 -20 2 0 {name=p16 sig_type=std_logic lab=avss}
C {lab_pin.sym} 0 -120 2 0 {name=p17 sig_type=std_logic lab=avdd}
C {lab_pin.sym} -170 40 0 0 {name=p18 sig_type=std_logic lab=vs3}
C {lab_pin.sym} -170 -40 0 0 {name=p19 sig_type=std_logic lab=vs4}
C {lab_pin.sym} 215 -240 1 0 {name=p20 sig_type=std_logic lab=vo_s1t}
C {netlist_not_shown.sym} -155 -285 0 0 {name=SIMULATION only_toplevel=false

value="

* Circuit Parameters
.param vdd = 1.2
.param vss = 0.0
.csparam VDD=\{vdd\}
.csparam VSS=\{vss\}
.param a=0
.param b=0
.param c=0
.param d=0
.param Tclk = 500n
.param a=0
.param b=0
.options TEMP = 65.0

* Include Models
.lib /opt/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.lib /opt/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerMOShv.lib mos_tt
.lib /opt/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerHBT.lib hbt_typ
.lib /opt/pdks/ihp-sg13g2/libs.tech/ngspice/models/cornerRES.lib res_typ


*.lib cornerMOSlv.lib mos_tt
*.lib cornerMOShv.lib mos_tt
*.lib cornerHBT.lib hbt_typ
*.lib cornerRES.lib res_typ
*.lib cornerCAP.lib cap_typ

* OP Parameters & Singals to save
.save all

*Simulations
.control
	tran 0.02u 10u
	setplot tran1
	plot v(vs4)+(5*2) v(vs3)+(4*2) v(vo_s1t)+(3*2) v(vo_s2t)+(2*2) v(vo_s3t)+2 v(vo_s4t) ylimit 0 12
	reset
	*dc @V3[a] 0 1.2 0.01
	let start_a=0
	let stop_a=1.2
	let delta_a=0.01
	let a_act=start_a
	while a_act le stop_a
		alterparam a = a_act
		reset
		run
		let a_act=a_act+delta_a
	end
	setplot dc1
	plot vo_s3t vs4 vs3 ylabel vout xlabel vin xlimit 0.55 0.65
	reset
	alter
	dc V3 0 1.2 0.01
	setplot dc2
	plot v(vo_s3t) v(vo_s2t) v(vs3) v(vs4) xlimit 0.55 0.65
	reset
	dc V3 0 1.2 0.01
	setplot dc3
	plot v(vo_s3t) v(vo_s2t) v(vs3) v(vs4) xlimit 0.55 0.65
.endc
.end"}
C {lab_pin.sym} 245 -95 1 0 {name=p21 sig_type=std_logic lab=vo_s2t}
C {lab_pin.sym} 245 65 1 0 {name=p22 sig_type=std_logic lab=vo_s3t}
C {lab_pin.sym} 220 220 1 0 {name=p23 sig_type=std_logic lab=vo_s4t}
C {/home/designer/UNIC-CASS-Aug25/BinarytoThermo/Circuit_stdcells.sym} 0 0 0 0 {name=x1}
C {lab_pin.sym} 0 120 0 0 {name=p8 sig_type=std_logic lab=avss}
C {lab_pin.sym} 390 -10 2 0 {name=p9 sig_type=std_logic lab=avss}
C {lab_pin.sym} 400 -160 2 0 {name=p10 sig_type=std_logic lab=avss}
C {lab_pin.sym} 400 150 2 0 {name=p11 sig_type=std_logic lab=avss}
C {lab_pin.sym} 400 310 2 0 {name=p12 sig_type=std_logic lab=avss}
C {lab_pin.sym} 325 -150 0 0 {name=p13 sig_type=std_logic lab=avdd}
C {lab_pin.sym} 325 10 0 0 {name=p14 sig_type=std_logic lab=avdd}
C {lab_pin.sym} 325 160 0 0 {name=p15 sig_type=std_logic lab=avdd}
C {/home/designer/UNIC-CASS-Aug25/BinarytoThermo/inv_prtt.sym} 360 -230 0 0 {name=x2}
C {/home/designer/UNIC-CASS-Aug25/BinarytoThermo/inv_prtt.sym} 360 -80 0 0 {name=x3}
C {/home/designer/UNIC-CASS-Aug25/BinarytoThermo/inv_prtt.sym} 360 80 0 0 {name=x4}
C {/home/designer/UNIC-CASS-Aug25/BinarytoThermo/inv_prtt.sym} 360 230 0 0 {name=x5}
C {lab_pin.sym} 940 -265 1 0 {name=p24 sig_type=std_logic lab=avdd}
C {bsource.sym} 980 130 0 0 {name=B1 VAR=I FUNC="'pwl(V(plus,minus),0,0, 1,10m, 2, 100m)'" m=1}
