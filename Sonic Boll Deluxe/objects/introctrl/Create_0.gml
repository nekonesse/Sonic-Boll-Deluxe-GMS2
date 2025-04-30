draw_texture_flush();
texturegroup_load("title_screen_sprites")
instance_create_depth(x,y,0,introblink)

instance_create_depth(200,y+16,0,introtape)
instance_create_depth(0,0,0,introfade)
instance_create_depth(0,0,0,intromode7)
instance_create_depth(0,y+16,0,introslide1)
instance_create_depth(0,y+16,0,introslide2)
repeat (20) instance_create_depth(0,0,99,introslide)

#region Initialize the Boll
boll = surface_create(360,360);
boll2 = surface_create(180,180);

u_outline_color = shader_get_uniform(shd_outline,"outlineColor");
sh_texel_handle=shader_get_uniform(shd_outline,"in_Texel")
#endregion
time=0;

depth=4;

df=degtorad(135)

x=round(200+(20+80*cos(df)))
y=round(140-80*sin(df))
ystart=96 

vs=0;
is=0;

lok=0; //whether or not the player can proceed to the menu

ye=0;
clicc=0;

f=0
bt=-1
bs=0
cango=0

blc=0