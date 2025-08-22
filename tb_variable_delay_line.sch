v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 1215 -735 2015 -335 {flags=graph
y1=-0.552
y2=1.658
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.9528559e-09
x2=1.2004735e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/tran_logic_not.raw
color="10 6"
node="in

out"}
B 2 2095 -735 2895 -335 {flags=graph
y1=2.542
y2=4.752
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=8.9528559e-09
x2=1.2004735e-08
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/tran_logic_not.raw
color=10
node=out}
N 1220 40 1220 60 {
lab=GND}
N 1760 0 1760 60 {
lab=GND}
N 1760 -230 1760 -60 {
lab=#net1}
N 1220 -80 1220 -20 {
lab=in}
N 1200 -80 1220 -80 {
lab=in}
N 1682.5 23.75 1682.5 63.75 {lab=GND}
N 1620 -40 1680 -40 {lab=out}
N 1427.5 112.5 1427.5 132.5 {lab=GND}
N 1340 -230 1760 -230 {lab=#net1}
N 1340 -40 1340 90 {lab=GND}
N 1427.5 50 1430 50 {lab=#net2}
N 1430 -42.5 1430 50 {lab=#net2}
N 1220 -83.75 1300 -83.75 {lab=in}
N 1220 -83.75 1220 -80 {lab=in}
N 1560 -83.75 1620 -83.75 {lab=out}
N 1620 -80 1620 -40 {lab=out}
N 1620 -80 1640 -80 {lab=out}
N 1620 -83.75 1620 -80 {lab=out}
N 1340 -133.75 1341.25 -133.75 {lab=#net1}
N 1340 -230 1340 -133.75 {lab=#net1}
C {devices/launcher.sym} 1896.25 -186.25 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/code_shown.sym} 1220 180 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
C {devices/code_shown.sym} 1827.5 -120 0 0 {name=NGSPICE only_toplevel=true 
value="
.param temp=27
.Param VCONT=0.9
.control
  save all
  *step param VCONT 0.40 0.90 0.05   ; barrido 0.40→0.90 V en pasos de 50 mV
   *Vcont vcont 0 PWL(0n 0.40 10n 0.90)
  tran 1p 20n
  *meas tran tdelay TRIG v(in) VAL=0.9 FALL=1 TARG v(out) VAL=0.9 RISE=1
  write tran_logic_not.raw
.endc
.end
"
}
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
C {devices/lab_pin.sym} 1640 -80 2 0 {name=p10 sig_type=std_logic lab=out}
C {devices/capa.sym} 1682.5 -7.5 0 0 {name=C2
m=1
value=1f
footprint=1206
device="ceramic capacitor"
}
C {devices/gnd.sym} 1682.5 62.5 0 0 {name=l8 lab=GND}
C {devices/gnd.sym} 1427.5 130 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 1427.5 80 0 0 {name=VCONT value="dc \{VCONT\}"}
C {variable_delay_line.sym} 1430 -82.5 0 0 {name=x1}
