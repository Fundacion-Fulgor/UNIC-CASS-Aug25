v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
N 902.5 -595 932.5 -595 {lab=vin}
N 1012.5 -595 1042.5 -595 {lab=vout}
N 962.5 -560 962.5 -535 {lab=GND}
N 962.5 -665 962.5 -630 {lab=vdd}
C {devices/code_shown.sym} 210 -650 0 0 {name=NGSPICE
only_toplevel=true
value="

vin vin 0 dc=0.6
vdd vdd 0 dc=1.2

.control
save all

dc vin 0 1.2 0.01

plot v(vout)


.endc
" }
C {devices/iopin.sym} 902.5 -595 0 1 {name=p2 lab=vin}
C {devices/code_shown.sym} 220 -300 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOSlv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
.endif
"}
C {devices/gnd.sym} 962.5 -535 0 0 {name=l1 lab=GND}
C {devices/iopin.sym} 1042.5 -595 0 0 {name=p4 lab=vout}
C {devices/iopin.sym} 962.5 -665 1 1 {name=p5 lab=vdd}
C {/foss/designs/DLL/others/inv_1_manual.sym} 962.5 -715 0 0 {name=x2
}
