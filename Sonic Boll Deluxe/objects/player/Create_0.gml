name="mario"

hsp=0;
vsp=0;
grav=0.3;
accel=0.3;
maxspd=3;
grounded=false;
p2=0

StartProgram = global.scripts[? name+"_start"]
StepProgram = global.scripts[? name+"_step"]

StartProgram();