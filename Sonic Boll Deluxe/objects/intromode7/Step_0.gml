starang=wrap_val(starang-0.1,0,359)

if !surface_exists(surf)
surf=surface_create(800,448)

if (surface_set_target(surf)) {
	draw_clear(c_black)
	draw_clear_alpha(c_black,0)
	xx-=0.002
    yy-=0.004
    
    if (xx<0) xx+=1/s
    if (yy<0) yy+=1/s
    
    x2=(x2+0.016) mod 1
    x3=(x3+1) mod 256
	
	draw_sprite_stretched(tex_sky,3,0,0,801,224) //draw the sky texture
	
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(tex_starfield,0,400,224,6,6,starang,starcol,0.4) //stars
	gpu_set_blendmode(0)
	
	var _uv_data = sprite_get_uvs(tex_introground, 0);
	var _umin = _uv_data[0], _vmin = _uv_data[1], _umax = _uv_data[2], _vmax = _uv_data[3];

	var vb = vertex_create_buffer();

	vertex_begin(vb, vertex_format);
	
    vertex_position_3d(vb,-70,-40,-5)
	vertex_texcoord(vb,_umin,_vmin)
	vertex_color(vb,c_white,1)
    vertex_position_3d(vb,70,-40,-5)
	vertex_texcoord(vb,_umin,_vmin)
	vertex_color(vb,c_white,1)
    vertex_position_3d(vb,-70,-5,-5)
	vertex_texcoord(vb,_umin,_vmin)
	vertex_color(vb,c_white,1)
    vertex_position_3d(vb,70,-5,-5)
	vertex_texcoord(vb,_umin,_vmin)
	vertex_color(vb,c_white,1)
    vertex_end(vb)

	var _tex = sprite_get_texture(tex_introground, 0);
	vertex_submit(vb, pr_trianglestrip, _tex);
	
	vertex_delete_buffer(vb)
}

surface_reset_target();