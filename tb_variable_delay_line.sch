v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1215 -735 2015 -335 {flags=graph
y1=-0.552
y2=1.658
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=4.9673746e-10
x2=5.2780446e-10
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="4 5"
node="out
in"}
N 1220 40 1220 60 {
lab=GND}
N 1760 0 1760 60 {
lab=GND}
N 1760 -230 1760 -60 {
lab=#net1}
N 1220 -80 1220 -20 {
lab=in}
N 1620 -80 1630 -80 {
lab=out}
N 1200 -80 1220 -80 {
lab=in}
N 1682.5 23.75 1682.5 63.75 {lab=GND}
N 1620 -40 1680 -40 {lab=out}
N 1620 -80 1620 -40 {lab=out}
N 1340 -230 1760 -230 {lab=#net1}
N 1340 -230 1340 -137.5 {lab=#net1}
N 1220 -87.5 1300 -87.5 {lab=in}
N 1340 -40 1340 90 {lab=GND}
N 1560 -87.5 1620 -87.5 {lab=out}
N 1620 -87.5 1620 -80 {lab=out}
N 1430 110 1430 130 {lab=GND}
N 1220 -87.5 1220 -80 {lab=in}
N 1220 -90 1220 -87.5 {lab=in}
N 1620 -90 1620 -87.5 {lab=out}
N 1430 -37.5 1430 50 {lab=#net2}
C {/foss/designs/DLL/variable_delay_line.sym} 1430 -86.25 0 0 {name=x1}
C {devices/launcher.sym} 1886.25 -186.25 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 1220 180 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 1817.5 -130 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.control
save all 
tran 1p 3n
*meas tran tdelay TRIG v(in) VAl=0.9 FALl=1 TARG v(out) VAl=0.9 RISE=1
write tran_logic_not.raw
.endc
"}
C {devices/gnd.sym} 1340 90 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 1220 60 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 1220 10 0 0 {name=Vin1 value="dc 0 ac 0 pulse(0, 1.2, 0, 25p, 25p, 250p, 500p ) "}
C {devices/vsource.sym} 1760 -30 0 0 {name=Vdd1 value=1.2}
C {devices/gnd.sym} 1760 60 0 0 {name=l4 lab=GND}
C {devices/launcher.sym} 1892.5 -232.5 0 0 {name=h1
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/tran_logic_not.raw tran"
}
C {devices/lab_pin.sym} 1200 -80 0 0 {name=p9 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} 1630 -80 2 0 {name=p10 sig_type=std_logic lab=out}
C {devices/capa.sym} 1682.5 -7.5 0 0 {name=C2
m=1
value=1f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 1682.5 62.5 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1430 130 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 1430 80 0 0 {name=Vdd2 value=0.1}
