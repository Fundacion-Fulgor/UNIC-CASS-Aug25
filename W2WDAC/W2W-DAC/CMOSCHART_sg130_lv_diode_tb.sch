v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {1. "shift+T", on a command window => turn on - off - (and something else xd).
2. In Simulation use the "use the netlist directory" option, for annotate.
3. The file create in the op must have the same name as the .sch.
4. "shift+I", the red path has the "analog lib", the gray one has the pdk cells.
	* In the analog lib, labwire is the label.
	* // 		   , labpin is the pin.
} 160 -550 0 0 0.3 0.3 {}
N 20 -130 20 -110 {lab=#net1}
N 20 -50 20 -20 {lab=GND}
N 140 -30 140 -20 {lab=GND}
N 240 -130 240 -110 {lab=#net2}
N 240 -50 240 -30 {lab=GND}
N 140 -30 240 -30 {lab=GND}
N 340 -130 420 -130 {lab=GND}
N 340 -150 340 -130 {lab=GND}
N 340 -240 340 -210 {lab=#net3}
N 460 -50 460 -20 {lab=GND}
N 460 -130 540 -130 {lab=#net4}
N 540 -150 540 -130 {lab=#net4}
N 340 -240 460 -240 {lab=#net3}
N 460 -240 540 -240 {lab=#net3}
N 900 -150 900 -130 {lab=#net5}
N 780 -200 860 -200 {lab=#net6}
N 780 -200 780 -150 {lab=#net6}
N 780 -90 780 -20 {lab=GND}
N 900 -290 900 -230 {lab=#net7}
N 900 -290 1040 -290 {lab=#net7}
N 1040 -290 1040 -270 {lab=#net7}
N 900 -50 900 -20 {lab=GND}
N 900 -50 970 -50 {lab=GND}
N 970 -90 970 -50 {lab=GND}
N 970 -90 1000 -90 {lab=GND}
N 930 -150 970 -150 {lab=#net5}
N 970 -150 970 -130 {lab=#net5}
N 970 -130 1000 -130 {lab=#net5}
N 1040 -210 1040 -140 {lab=#net8}
N 900 -200 930 -200 {lab=#net5}
N 930 -200 930 -150 {lab=#net5}
N 460 -240 460 -160 {lab=#net3}
N 900 -70 900 -50 {lab=GND}
N 900 -170 900 -150 {lab=#net5}
N 900 -150 930 -150 {lab=#net5}
N 140 -240 140 -160 {lab=#net1}
N 20 -130 100 -130 {lab=#net1}
N 140 -100 140 -30 {lab=GND}
N 140 -130 240 -130 {lab=#net2}
N 1040 -80 1040 -20 {lab=GND}
N 540 -240 540 -210 {lab=#net3}
N 20 -240 20 -130 {lab=#net1}
N 20 -240 140 -240 {lab=#net1}
N 340 -130 340 -50 {lab=GND}
N 340 -50 460 -50 {lab=GND}
N 460 -100 460 -50 {lab=GND}
C {vsource.sym} 20 -80 0 0 {name=VGS value=\{VGS_value_DC\} savecurrent=false }
C {gnd.sym} 20 -20 0 0 {name=l1 lab=GND}
C {gnd.sym} 140 -20 0 0 {name=l2 lab=GND}
C {vsource.sym} 240 -80 2 0 {name=VBS value=\{VBS_value_DC\} savecurrent=false}
C {code.sym} 1130 -130 0 0 {name=VGS_OP_CharNMOS only_toplevel=false value="
.temp 65


*su barrido varia vds y luego genera 14 curvas para los diferentes vgs
*dc Vds 0 1.8 0.01 Vgs 0 1.8 0.1


* VGS SWEEP
.dc VGS 0.0 1.8 0.01 VDS 0.9

.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[vsat]
.save @n.xm1.nsg13_lv_nmos[cgg]
.save @n.xm1.nsg13_lv_nmos[gds]

.control
run
let idn = @n.xm1.nsg13_lv_nmos[ids]
let gmn = @n.xm1.nsg13_lv_nmos[gm]
let vdsatn = @n.xm1.nsg13_lv_nmos[vsat]
let gm_idn = gmn/idn
let cggn = @n.xm1.nsg13_lv_nmos[cgg]
let ftn = gmn/(6.283*cggn)
let ftgmidn = ftn*gm_idn
let ron = 1/@n.xm1.nsg13_lv_nmos[gds]
let aon = gmn*ron

*use if you want to design with the gmoverid curve
meas dc VGS_meas WHEN gm_idn=13.57
*measure parameters of interest
meas dc aon_meas FIND aon WHEN v-sweep=VGS_meas
meas dc ftn_meas FIND ftn WHEN v-sweep=VGS_meas
meas dc idn_meas FIND idn WHEN v-sweep=VGS_meas
meas dc gmn_meas FIND gmn WHEN v-sweep=VGS_meas
meas dc gm_idn_meas FIND gm_idn WHEN v-sweep=VGS_meas

*use if you want to design with the vdsat curve
*meas dc VGS_meas WHEN vdsatn=200m
*meas dc gmn_meas FIND gmn WHEN v-sweep=VGS_meas


*plot idn
*plot vdsatn
*plot gmn
plot gm_idn
*plot cggn
*plot ftn
*plot ftgmidn
*plot aon
.endc

"
spice_ignore=true}
C {code.sym} 140 -390 0 0 {name=OPNMOS only_toplevel=false value="

.op
.save all
.control

run
let Vgsn = @n.xm1.nsg13_lv_nmos[vgs]
let Vdsn = @n.xm1.nsg13_lv_nmos[vds]
let idn = @n.xm1.nsg13_lv_nmos[ids] 
let gmn = @n.xm1.nsg13_lv_nmos[gm]     
let vdsatn = @n.xm1.nsg13_lv_nmos[vsat] 
let vthn = @n.xm1.nsg13_lv_nmos[vth] 
let ron = @n.xm1.nsg13_lv_nmos[gds]  
let cggn = @n.xm1.nsg13_lv_nmos[cgg] 
let gm_idn = gmn/idn
let ftn = gmn / (6.283 * cggn)  
let ftgm_idn = ftn * (gmn/idn) 
let aon = gmn*ron 
let Vovn = Vgsn - vthn
let deltaVdsn = Vdsn - vdsatn

print Vgsn Vdsn idn vdsatn vthn deltaVdsn Vovn gmn ron cggn gm_idn ftn ftgm_idn aon

write CMOSCHART_sg130_lv_tb.raw
set appendwrite


.endc
"
}
C {vsource.sym} 340 -180 0 0 {name=VSG value=\{VGS_value_DC\} savecurrent=false}
C {gnd.sym} 460 -20 0 0 {name=l4 lab=GND}
C {vsource.sym} 540 -180 2 0 {name=VSB value=\{VBS_value_DC\} savecurrent=false}
C {code.sym} 280 -390 0 0 {name=VGSCharPMOS only_toplevel=false value="

.dc VSG 0.0 1.8 0.01

.save @n.xm2.nsg13_lv_pmos[ids]
.save @n.xm2.nsg13_lv_pmos[gm]
.save @n.xm2.nsg13_lv_pmos[vsat]
.save @n.xm2.nsg13_lv_pmos[cgg]
.save @n.xm2.nsg13_lv_pmos[gds]

.control

run
let idp = @n.xm2.nsg13_lv_pmos[ids] 
let gmp = @n.xm2.nsg13_lv_pmos[gm]   
let vdsatp = @n.xm2.nsg13_lv_pmos[vsat] 
let gm_idp = gmp/(1e-15+idp)
let cggp = @n.xm2.nsg13_lv_pmos[cgg]
let ftp = gmp/(6.283*cggp)
let ftgmidp = ftp*gm_idp
let rop = 1/@n.xm2.nsg13_lv_pmos[gds]  
let aop = gmp*rop

*use if you want to design with the gmoverid curve
meas dc VGS_meas WHEN gm_idp=13.57
*measure parameters of interest
meas dc aop_meas FIND aop WHEN v-sweep=VGS_meas
meas dc ftp_meas FIND ftp WHEN v-sweep=VGS_meas
meas dc idp_meas FIND idp WHEN v-sweep=VGS_meas
meas dc gmp_meas FIND gmp WHEN v-sweep=VGS_meas
meas dc gm_idp_meas FIND gm_idp WHEN v-sweep=VGS_meas

*use if you want to design with the vdsat curve
*meas dc VGS_meas WHEN vdsatn=200m
*meas dc gmn_meas FIND gmn WHEN v-sweep=VGS_meas

*plot idp
*plot vdsatn
*plot gmn
*plot gm_idp
*plot cggn
*plot ftn
*plot ftgmidn
*plot aon

.endc
"
spice_ignore=true}
C {code.sym} 430 -390 0 0 {name=OPPMOS only_toplevel=false value="

.op
.save all
.control
run
let Vgsp = @n.xm2.nsg13_lv_pmos[vgs]
let Vdsp = @n.xm2.nsg13_lv_pmos[vds]
let idp = @n.xm2.nsg13_lv_pmos[ids] 
let gmp = @n.xm2.nsg13_lv_pmos[gm]     
let vdsatp = @n.xm2.nsg13_lv_pmos[vsat] 
let vthp = @n.xm2.nsg13_lv_pmos[vth] 
let rop = 1/@n.xm2.nsg13_lv_pmos[gds]  
let cggp = @n.xm2.nsg13_lv_pmos[cgg] 
let gm_idp = gmp/idp
let ftp = gmp / (6.283 * cggp)  
let ftgm_idp = ftp * (gmp/idp) 
let aop = gmp*rop
let Vovp = Vgsp - vthp
let deltaVdsp = Vdsp - vdsatp

write CMOSCHART_sg130_lv_tb.raw
set appendwrite

print Vgsp Vdsp idp vdsatp vthp deltaVdsp Vovp gmp rop cggp gm_idp ftp ftgm_idp aop


.endc
"
spice_ignore=true}
C {isource.sym} 900 -100 0 0 {name=I0 value= 0.2m}
C {gnd.sym} 780 -20 0 0 {name=l5 lab=GND}
C {vsource.sym} 780 -120 0 0 {name=V6 value=0.9 savecurrent=false }
C {vsource.sym} 1040 -240 0 0 {name=V7 value=0.9 savecurrent=false}
C {vcvs.sym} 1040 -110 0 0 {name=E1 value=1}
C {gnd.sym} 900 -20 0 0 {name=l6 lab=GND}
C {gnd.sym} 1040 -20 0 0 {name=l7 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 120 -130 2 1 {name=M1
l=\{ln1\}
w=\{wn1\}
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 440 -130 0 0 {name=M2
l=\{lp1\}
w=\{wp1\}
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 880 -200 2 1 {name=M3
l=0.45u
w=1.0u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {code.sym} 0 -390 0 0 {name=VGSCharNMOS only_toplevel=true value="

.save @n.xm1.nsg13_lv_nmos[ids]
.save @n.xm1.nsg13_lv_nmos[gm]
.save @n.xm1.nsg13_lv_nmos[vds]
.save @n.xm1.nsg13_lv_nmos[vsat]
.save @n.xm1.nsg13_lv_nmos[cgg]
.save @n.xm1.nsg13_lv_nmos[gds]


.dc VGS 0.0 1.2 0.01 
.control
run

let idn = @n.xm1.nsg13_lv_nmos[ids]
let gmn = @n.xm1.nsg13_lv_nmos[gm]
let vdsatn = @n.xm1.nsg13_lv_nmos[vsat]
let gm_idn = gmn/(1e-15+idn)
let cggn = @n.xm1.nsg13_lv_nmos[cgg]
let ftn = gmn/(6.283*cggn)
let ftgmidn = ftn*gm_idn
let ron = 1/@n.xm1.nsg13_lv_nmos[gds]
let aon = gmn*ron
let vds = @n.xm1.nsg13_lv_nmos[vds]

*use if you want to design with the gmoverid curve
meas dc VGS_meas WHEN gm_idn=13.57
*measure parameters of interest
meas dc aon_meas FIND aon WHEN v-sweep=VGS_meas
meas dc ftn_meas FIND ftn WHEN v-sweep=VGS_meas
meas dc idn_meas FIND idn WHEN v-sweep=VGS_meas
meas dc gmn_meas FIND gmn WHEN v-sweep=VGS_meas
meas dc gm_idn_meas FIND gm_idn WHEN v-sweep=VGS_meas

*use if you want to design with the vdsat curve
*meas dc VGS_meas WHEN vdsatn=200m
*meas dc gmn_meas FIND gmn WHEN v-sweep=VGS_meas

*plot idn
*plot vdsatn
*plot gmn
*plot gm_idn
*plot cggn
*plot ftn
*plot ftgmidn
*plot aon

.endc
"
spice_ignore=true}
C {devices/code_shown.sym} 0 -590 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value=".lib cornerMOSlv.lib mos_tt
"}
C {devices/launcher.sym} 880 -610 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 880 -580 0 0 {name=h1
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {code.sym} 1120 -280 0 0 {name=VGS_OP_CharPMOS only_toplevel=false value="

.temp 65
.control
param Wn=1.3u Ln=0.13u Wp=1.3u Lp=0.13u
save all
* VGS SWEEP

*su barrido varia vds y luego genera 14 curvas para los diferentes vgs
*dc Vds 0 1.5 0.01 Vgs 0 1.5 0.1

dc VSG 0.0 1.8 0.01 VDS 0.9
write CMOSCHART_sg130_lv_tb.raw
set appendwrite

let idp = @n.xm2.nsg13_lv_pmos[ids] 
let gmp = @n.xm2.nsg13_lv_pmos[gm]   
let vdsatp = @n.xm2.nsg13_lv_pmos[vsat] 
let gm_idp = gmp/idp
let cggp = @n.xm2.nsg13_lv_pmos[cgg]
let ftp = gmp/(6.283*cggp)
let ftgmidp = ftp*gm_idp
let rop = 1/@n.xm2.nsg13_lv_pmos[gds]  
let aop = gmp*rop

*use if you want to design with the gmoverid curve
meas dc VGS_meas WHEN gm_idp=13.57
*measure parameters of interest
meas dc aop_meas FIND aop WHEN v-sweep=VGS_meas
meas dc ftp_meas FIND ftp WHEN v-sweep=VGS_meas
meas dc idp_meas FIND idp WHEN v-sweep=VGS_meas
meas dc gmp_meas FIND gmp WHEN v-sweep=VGS_meas
meas dc gm_idp_meas FIND gm_idp WHEN v-sweep=VGS_meas

*use if you want to design with the vdsat curve
*meas dc VGS_meas WHEN vdsatn=200m
*meas dc gmn_meas FIND gmn WHEN v-sweep=VGS_meas

*plot idn
*plot vdsatn
*plot gmn
*plot gm_idn
*plot cggn
*plot ftn
*plot ftgmidn
*plot aon

*****     OP     *****
op
save @n.xm2.nsg13_lv_pmos[gm]
save @n.xm2.nsg13_lv_pmos[gds]
save @n.xm2.nsg13_lv_pmos[vth]
save @n.xm2.nsg13_lv_pmos[cgg]
save @n.xm2.nsg13_lv_pmos[cgd]
save @n.xm2.nsg13_lv_pmos[vdss]
save @n.xm2.nsg13_lv_pmos[fug]
save @n.xm2.nsg13_lv_pmos[rg]
save @n.xm2.nsg13_lv_pmos[sid]

let Vgsp = @n.xm2.nsg13_lv_pmos[vgs]
let Vdsp = @n.xm2.nsg13_lv_pmos[vds]
let idp = @n.xm2.nsg13_lv_pmos[ids] 
let gmp = @n.xm2.nsg13_lv_pmos[gm]     
let vdsatp = @n.xm2.nsg13_lv_pmos[vsat] 
let vthp = @n.xm2.nsg13_lv_pmos[vth] 
let rop = 1/@n.xm2.nsg13_lv_pmos[gds]  
let cggp = @n.xm2.nsg13_lv_pmos[cgg] 
let gm_idp = gmp/idp
let ftp = gmp / (6.283 * cggp)  
let ftgm_idp = ftp * (gmp/idp) 
let aop = gmp*rop
let Vovp = Vgsp - vthp
let deltaVdsp = Vdsp - vdsatp

write CMOSCHART_sg130_lv_tb.raw
set appendwrite

print Vgsp Vdsp idp vdsatp vthp deltaVdsp Vovp gmp rop cggp gm_idp ftp ftgm_idp aop



.endc
"
spice_ignore=true}
C {code.sym} 0 -540 0 0 {name=Parameters only_toplevel=false value="
.temp 65
.param wn1=0.3u
.param ln1=0.39u
.param wp1=3.235u
.param lp1=0.39u
.param VGS_value_DC=0.6
.param VBS_value_DC=0

"
}
C {code.sym} 920 -520 0 0 {name=Wsweep only_toplevel=false value="
.option sparse
.param wp1=1u
.param lp1=0.52u
.temp 65
.param wn1=1u
.param ln1=0.52u
.param VGS_value_DC=0.6
.param VBS_value_DC=0

.op
.save all
.control
option numdgt=3
set wr_singlescale
set wr_vecnames

compose wp_vec start=1.44u stop=1.46u step=0.005u
*6u 6.5u 7u 7.5u 8u 8.5u 9u 9.5u 10u 10.5u 11u 11.5u 12u 12.5u 13u 13.5u 14u 14.5u 15u 15.5u 16u 16.5u 17u
*50u 55u 60u 65u 70u 75u 80u 85u 90u 95u 100u 105u 110u 115u 120u 125u 130u 135u 140u 145u 150u 155u 160u 165u 170u 175u 180u 185u 190u 195u 200u
*2u 2.5u 3u 3.5u 4u 4.5u 5u 5.5u 6u 6.5u 7u 7.5u 8u 8.5u 9u 9.5u 10u 10.5u 11u 11.5u 12u

foreach var1 $&wp_vec
  alterparam wp1 = $var1
  reset
  run
  let Vgsp = @n.xm2.nsg13_lv_pmos[vgs]
  let Vdsp = @n.xm2.nsg13_lv_pmos[vds]
  let idp = @n.xm2.nsg13_lv_pmos[ids] 
  let vdsatp = @n.xm2.nsg13_lv_pmos[vsat] 
  let vthp = @n.xm2.nsg13_lv_pmos[vth] 
  let rop = @n.xm2.nsg13_lv_pmos[gds]  
  let cggp = @n.xm2.nsg13_lv_pmos[cgg] 
  let Vovp = Vgsp - vthp
  let deltaVdsp = Vdsp - vdsatp
  let wp = @n.xm2.nsg13_lv_pmos[w]
  print wp Vgsp Vdsp idp vdsatp vthp deltaVdsp Vovp rop cggp
  destroy all
  set appendwrite
  unset set wr_vecnames
end

set appendwrite=0

alterparam wp1=0.1u

reset

write CMOSCHART_sg130_lv_tb.raw
set appendwrite


.endc
"
spice_ignore=true}
C {code.sym} 790 -520 0 0 {name=Wdesign only_toplevel=false value="
* ------------ parámetros del circuito (no tocar aquí) ------------
.option numdgt=6
.temp 65
.param wn1=0.13u
.param ln1=0.52u
.param VGS_value_DC=0.6
.param VBS_value_DC=0

.control
  * ===== Objetivo y tolerancias =====
  let idt   = 10u           ; Id_target = 10 µA
  let reltol= 0.02          ; tolerancia relativa (2%)
  let abstol= 50n           ; tolerancia absoluta mínima (50 nA)
  let tol   = max(abs(idt*reltol), abs(abstol))
  let k     = 0
  let kmax  = 3            ; ajústalo tú

  * ===== 1) evaluación inicial con wp1/lp1/VGS/VBS actuales =====
  reset
  op
  let ir = @n.xm1.nsg13_lv_nmos[ids]
  let wr = @n.xm1.nsg13_lv_nmos[w]

  * ===== 2) iteraciones =====
  while ( abs(ir - idt) > tol & k < kmax )
    let wd = (idt/ir)*wr
    alterparam wp1 = $wd
    reset
    op
    let ir = @n.xm1.nsg13_lv_nmos[ids]
    let wr = @n.xm1.nsg13_lv_nmos[w]
    let k  = k + 1
  end

  * ===== 3) salida pedida: W e I finales =====
  echo "W_final [m]    I_final [A]"
  print wr ir
.endc

"
spice_ignore=true}
