if (!ye) {
    f=min(1,f+0.01)
    df=degtorad(135-sqr(f)*360)
    
    x=200+(20+80*cos(df))*sqrt(1-f)
    y=128-80*sin(df)
    
    if (f=1 && !ye) {
        ye=1
        bt=0
        vspeed=-8
        bs=1
    }
} else x=200

if (blc<35) if (global.roomTimer mod 35 == 0) {blc+=1 repeat (2) instance_create_depth(irandom_range(x-64*bs,x+64*bs),irandom_range(y-64*bs,y+64*bs),0,introblink)}

if (!lok) {
    if (input_any_pressed()) {
        if (!clicc) {
            clicc=1
            if (cango) {
                lok=1
                alarm[0]=-1
                segafadeto(mainmenu,"systemgo",false,false,false,true)
            }         
            if (!cango) {
                cango=1
                ye=1
                x=xstart y=ystart
                vspeed=0
                bt=2 bs=1 vs=1
                with (introfade) alarm[0]=1
                with (introslide1) alarm[0]=1*!!alarm[0]
                with (introslide2) alarm[0]=1*!!alarm[0]
                with (introtape) alarm[0]=1*!!alarm[0]    
                with (intromode7) alarm[0]=1*!!alarm[0] 
            }
        }
    } else clicc=0
}

time+=1

if (bt=-1) {bs=sqr(f) time+=3}
if (bt=0) {vspeed+=0.3 if (y>ystart-20 && vspeed>0) {bs=(y-(ystart-90))/70 if (y>ystart+20) {bt=1 vspeed=-4}}}
if (bt=1) {bs=(0.9+bs*5)/6 vspeed+=0.2 if (y>ystart+6 && vspeed>0) {y=ystart+6 vspeed=0 bt=2}}
if (bt=2) {bs=(1+bs*3)/4}

if (bt=-1) is=bs else is=1/bs

vs=mean(bs,vs)

if !surface_exists(boll)
boll = surface_create(360,360);
if !surface_exists(boll2)
boll2 = surface_create(180,180);

if (!surface_set_target(boll2)) exit
draw_circle(90,90,80,false)
gpu_set_blendmode(bm_subtract)
draw_circle(90,90,70,false)
gpu_set_blendmode(0)
surface_reset_target();

if (!surface_set_target(boll)) exit
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
draw_clear(c_black)
draw_clear_alpha(c_black,0)

var camera = camera_get_active();

var view_mat = matrix_build_lookat(0, 0, 0, 0, 0, 1000, 0, 1, 0);
var curr_view = camera_get_view_mat(camera);
camera_set_view_mat(camera, view_mat);
camera_apply(camera);

draw_set_lighting(true)
var amb=draw_light_get_ambient();
draw_light_define_ambient($aa0000)
draw_light_define_direction(0,-1,1,-1,$bbdd)
draw_light_define_direction(2,1,-1,1,$ff)
draw_light_define_point(1,50,90-50-90,50,66,$666666)
draw_light_enable(0,1)
draw_light_enable(1,1)
draw_light_enable(2,1)

var currmat=matrix_get(matrix_world)
matrix_set(matrix_world, matrix_build(0, 0, 0, time*1.3, time, time*0.7, 72, 72, 72));
vertex_submit(global.boll, pr_trianglelist, -1);

matrix_set(matrix_world, matrix_build_identity());
matrix_set(matrix_world,currmat);
camera_set_view_mat(camera, curr_view);
camera_apply(camera);
draw_light_enable(0,0)
draw_light_enable(1,0)
draw_light_enable(2,0)
draw_light_define_ambient(amb);
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);
gpu_set_blendmode(bm_subtract)
draw_surface(boll2,89,89)
gpu_set_blendmode(0)
surface_reset_target();