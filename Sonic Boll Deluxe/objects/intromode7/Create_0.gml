depth=100;
surf=surface_create(800,448)

tex1=sprite_get_texture(tex_clouds,0)
tex2=sprite_get_texture(tex_introground,0)

alarm[0]=180
image_xscale=100;
image_yscale=10;

xx=random(32)
yy=random(32)
x2=random(32768)
x3=random(32768)
col1=$404000 
col2=$aaaa00
starcol=make_color_rgb(255,255,128)
starang=0;
s=1

test=0

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_color();
vertex_format = vertex_format_end();

s=1