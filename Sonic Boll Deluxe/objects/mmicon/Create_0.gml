image_speed=0
s=-1
s2=-1
time=0
over=0
boll = -1;
boll2 = -1;
depth=2;

u_outline_color = shader_get_uniform(shd_outline,"outlineColor");
sh_texel_handle = shader_get_uniform(shd_outline,"in_Texel");

//if (room=stagesel && image_index=1 && global.stagecount) instance_destroy()