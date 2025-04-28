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

time+=1

if (bt=-1) {bs=sqr(f) time+=3}
if (bt=0) {vspeed+=0.3 if (y>ystart-20 && vspeed>0) {bs=(y-(ystart-90))/70 if (y>ystart+20) {bt=1 vspeed=-4}}}
if (bt=1) {bs=(0.9+bs*5)/6 vspeed+=0.2 if (y>ystart+6 && vspeed>0) {y=ystart+6 vspeed=0 bt=2}}
if (bt=2) {bs=(1+bs*3)/4}

if (bt=-1) is=bs else is=1/bs

vs=mean(bs,vs)

if !surface_exists(boll)
boll = surface_create(180,180);
if !surface_exists(boll2)
boll2 = surface_create(180,180);

if (!surface_set_target(boll2)) exit
draw_circle(80,80,80,false)
gpu_set_blendmode(bm_subtract)
draw_circle(80,80,70,false)
gpu_set_blendmode(0)
surface_reset_target();

if (!surface_set_target(boll)) exit
gpu_set_zwriteenable(true);
gpu_set_ztestenable(true);
draw_clear(c_black)
draw_clear_alpha(c_black,0)

var camera = camera_get_active();

var view_mat = matrix_build_lookat(0, 0, 0, 0, 0, 1000, 0, 1, 0);
camera_set_view_mat(camera, view_mat);
camera_apply(camera);

//shader_set(shd_diffuse)
draw_set_lighting(true)
draw_light_define_ambient($aa0000)
draw_light_define_direction(0,-1,1,-1,$bbdd)
draw_light_define_direction(2,1,-1,1,$ff)
draw_light_define_point(1,50,90-50-90,50,66,$666666)
draw_light_enable(0,1)
draw_light_enable(1,1)
draw_light_enable(2,1)

//matrix_set(matrix_world, matrix_build(0, 0, 0, time*1.3, time, time*0.7, 72, 72, 72));
//vertex_submit(global.boll, pr_trianglelist, -1);

matrix_set(matrix_world, matrix_build_identity());
shader_reset();
gpu_set_zwriteenable(false);
gpu_set_ztestenable(false);
gpu_set_blendmode(bm_subtract)
draw_surface(boll2,-80,-80)
gpu_set_blendmode(0)
surface_reset_target();