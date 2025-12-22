v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Nx - number of emitters} 760 -730 0 0 0.2 0.2 {}
N 800 -820 800 -760 {
lab=GND}
N 930 -820 930 -760 {
lab=GND}
N 800 -920 800 -880 {
lab=#net1}
N 930 -920 930 -880 {
lab=#net2}
N 800 -850 850 -850 {
lab=GND}
N 850 -850 850 -760 {
lab=GND}
N 800 -920 830 -920 {
lab=#net1}
N 890 -920 930 -920 {
lab=#net2}
N 690 -850 760 -850 {lab=#net3}
N 690 -850 690 -840 {lab=#net3}
C {devices/code_shown.sym} 310 -790 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ

.endif
"}
C {devices/code_shown.sym} 310 -550 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerHBT.lib hbt_typ
"}
C {devices/code_shown.sym} 1140 -840 0 0 {name=NGSPICE1 only_toplevel=true 
value="
.param temp=27
.control
save all 
op
*vbe d1 0 dc=0.75
dc Vce 0 1.2 0.01
* Get collector current (positive)

plot I(Vc)

wrdata data_ic_HBT.txt I(Vc)
.endc
"

}
C {devices/gnd.sym} 800 -760 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 930 -850 0 0 {name=Vce value=0.7}
C {devices/gnd.sym} 930 -760 0 0 {name=l4 lab=GND}
C {devices/gnd.sym} 850 -760 0 0 {name=l5 lab=GND}
C {devices/launcher.sym} 1040 -910 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/test_npn_13G2.raw dc"
}
C {devices/ammeter.sym} 860 -920 1 0 {name=Vc}
C {sg13g2_pr/npn13G2.sym} 780 -850 0 0 {name=Q1
model=npn13G2
spiceprefix=X
Nx=1
}
C {devices/isource.sym} 690 -810 2 0 {name=I0 value=1u}
C {devices/gnd.sym} 690 -780 0 0 {name=l2 lab=GND}
