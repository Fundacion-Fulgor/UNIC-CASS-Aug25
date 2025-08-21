v {xschem version=3.4.8RC file_version=1.2}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 580 -410 1380 -10 {flags=graph
y1=6.6e-08
y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=1.2
divx=5
subdivx=1


dataset=-1
unitx=1
logx=0
logy=0
color="12 7"
node="Vout
Vin"}
N 60 -110 60 -50 {
lab=GND}
N 60 -210 60 -170 {lab=VDD}
N 340 -220 340 -180 {lab=VDD}
N 340 -100 340 -60 {lab=GND}
N 210 -140 210 -120 {lab=Vin}
N 210 -60 210 -30 {lab=GND}
N 210 -140 290 -140 {lab=Vin}
N 480 -140 480 -120 {lab=Vout}
N 410 -140 480 -140 {lab=Vout}
N 480 -60 480 -30 {lab=GND}
C {inv.sym} 250 0 0 0 {name=x1}
C {code.sym} 10 -350 0 0 {name=VGSCharNMOS only_toplevel=true value="
.dc VGS 0.0 1.2 0.01 
.control
save all
run
let vout = v(Vout)
let vin = v(Vin)
let vout_vin = vout - vin
meas dc Vm WHEN vout_vin=0

write dc_logic_not.raw

.endc
"
}
C {devices/vsource.sym} 60 -140 0 0 {name=Vdd value=1.2}
C {devices/gnd.sym} 60 -50 0 0 {name=l34 lab=GND}
C {devices/lab_pin.sym} 60 -210 0 0 {name=p26 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 340 -220 0 0 {name=p1 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 340 -60 0 0 {name=l1 lab=GND}
C {vsource.sym} 210 -90 0 0 {name=VGS value=0.6 savecurrent=false }
C {gnd.sym} 210 -30 0 0 {name=l2 lab=GND}
C {capa.sym} 480 -90 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} 480 -30 0 0 {name=l3 lab=GND}
C {devices/launcher.sym} 240 -350 0 0 {name=h5
descr="load waves Ctrl + left click" 
tclcommand="xschem raw_read $netlist_dir/dc_logic_not.raw dc"
}
C {devices/launcher.sym} 240 -305 0 0 {name=h3
descr="Simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/lab_pin.sym} 480 -140 2 0 {name=p2 sig_type=std_logic lab=Vout}
C {devices/lab_pin.sym} 210 -140 0 0 {name=p3 sig_type=std_logic lab=Vin}
C {devices/code_shown.sym} 30 -460 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib cornerMOSlv.lib mos_tt
"}
