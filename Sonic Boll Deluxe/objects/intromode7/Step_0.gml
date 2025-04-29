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
	draw_sprite_ext(tex_starfield,0,400,224,6,6,starang,starcol,0.2) //stars
	gpu_set_blendmode(0)
	
	if keyboard_check(vk_left) xpos--;
	if keyboard_check(vk_right) xpos++;
	
	if keyboard_check(vk_numpad7) ypos--;
	if keyboard_check(vk_numpad8) ypos++;
	
	if keyboard_check(vk_numpad4) zpos--;
	if keyboard_check(vk_numpad5) zpos++;
	
	if keyboard_check(vk_numpad1) fov--;
	if keyboard_check(vk_numpad2) fov++;
	
	var camera = camera_get_active();
	var curr_view = camera_get_view_mat(camera);
	var curr_proj = camera_get_proj_mat(camera);
	camera_set_view_mat(camera,matrix_build_lookat(0,0,0,0,-10,0,0,0,-1))
	camera_set_proj_mat(camera,matrix_build_projection_perspective_fov(fov,400/224,1,1000))
	camera_apply(camera);
	
	var currmat=matrix_get(matrix_world)
	matrix_set(matrix_world,matrix_build(0,-20,32,0,0,0,1,5,1))
	var oldrep = gpu_get_texrepeat();
    gpu_set_texrepeat(true);
	
	gpu_set_blendmode(bm_add)
	vertex_begin(v_buff, vertex_format)
	vertex_position_3d(v_buff,   -200, -40, -5); vertex_color(v_buff, $644000, 0.5); vertex_texcoord(v_buff, xx*s,-yy*s);
	vertex_position_3d(v_buff,   200, -40, -5); vertex_color(v_buff, $644000, 0.5); vertex_texcoord(v_buff, (xx+lengthdir_x(2.5,30))*s,-(yy+lengthdir_y(2.5,30))*s);
	vertex_position_3d(v_buff,   -200, -5, -5); vertex_color(v_buff, $644000, 1); vertex_texcoord(v_buff, (xx+lengthdir_x(2.5,300))*s,-(yy+lengthdir_y(2.5,300))*s);
	vertex_position_3d(v_buff, 200, -5, -5); vertex_color(v_buff, $644000, 1); vertex_texcoord(v_buff, (xx+lengthdir_x(2.5,30)+lengthdir_x(2.5,300))*s,-(yy+lengthdir_y(2.5,30)+lengthdir_y(2.5,300))*s);
	vertex_end(v_buff)
	vertex_submit(v_buff, pr_trianglestrip,sprite_get_texture(tex_clouds,0));
	matrix_set(matrix_world,currmat)
	gpu_set_blendmode(0)
	
	var oldrep = gpu_get_texrepeat();
    gpu_set_texrepeat(true);	
	var currmat=matrix_get(matrix_world)
	matrix_set(matrix_world,matrix_build(0,-30,-18,30,0,0,1,1,1))
	
	vertex_begin(v_buff, vertex_format)
	vertex_position_3d(v_buff,   -140, -100, -35); vertex_color(v_buff, col1, 1); vertex_texcoord(v_buff, x2, 0);
	vertex_position_3d(v_buff,   -140, 0, 5); vertex_color(v_buff, col2, 1); vertex_texcoord(v_buff, x2, 4);
	vertex_position_3d(v_buff,   140, -100, -35); vertex_color(v_buff, col1, 1); vertex_texcoord(v_buff, x2-8,0);
	vertex_position_3d(v_buff, 140, 0, 5); vertex_color(v_buff, col2, 1); vertex_texcoord(v_buff, x2-8,4);
	vertex_end(v_buff)
	vertex_submit(v_buff, pr_trianglestrip,sprite_get_texture(tex_introground,0));
	
	gpu_set_texrepeat(oldrep);
	matrix_set(matrix_world,currmat)
	camera_set_view_mat(camera,curr_view)
	camera_set_proj_mat(camera,curr_proj)
	camera_apply(camera);
}

surface_reset_target();