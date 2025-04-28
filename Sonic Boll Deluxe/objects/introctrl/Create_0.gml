instance_create_depth(200,y+16,0,introtape)
instance_create_depth(0,0,0,introfade)
instance_create_depth(0,0,0,intromode7)

#region Initialize the Boll
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

global.boll = import_obj_optimized("boll.obj", vertex_format);

boll = surface_create(360,360);
boll2 = surface_create(180,180);
#endregion

sh_texel_handle=shader_get_uniform(shd_outline,"in_Texel")
time=0;

depth=4;

df=degtorad(135)

x=round(200+(20+80*cos(df)))
y=round(140-80*sin(df))
ystart=96 

vs=0;
is=0

ye=0;

f=0
bt=-1
bs=0
cango=0