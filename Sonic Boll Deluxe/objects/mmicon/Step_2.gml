if (image_index=0) {
    time+=1
    if !surface_exists(boll)
	boll = surface_create(82,82);
	if !surface_exists(boll2)
	boll2 = surface_create(82,82);

	if (!surface_set_target(boll2)) exit
	draw_circle(41,41,50,false)
	gpu_set_blendmode(bm_subtract)
	draw_circle(41,41,36,false)
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
	draw_light_define_ambient(c_black)
	if (over) {
		draw_light_define_direction(0,-1,1,-1,$aa00)
		draw_light_define_direction(1,1,-1,1,$8000)
	} else {
		draw_light_define_direction(0,-1,1,-1,$aaaaaa)
		draw_light_define_direction(1,1,-1,1,$808080)
	}
	draw_light_enable(0,1)
	draw_light_enable(1,1)

	var currmat=matrix_get(matrix_world)
	matrix_set(matrix_world, matrix_build(0, 0, 0, time*1.3, time, time*0.7, 38, 38, 38));
	vertex_submit(global.boll, pr_trianglelist, -1);

	matrix_set(matrix_world, matrix_build_identity());
	matrix_set(matrix_world,currmat);
	camera_set_view_mat(camera, curr_view);
	camera_apply(camera);
	gpu_set_zwriteenable(false);
	gpu_set_ztestenable(false);
	gpu_set_blendmode(bm_subtract)
	draw_surface(boll2,0,0)
	gpu_set_blendmode(0)
	surface_reset_target();
	draw_light_enable(0,0)
	draw_light_enable(1,0)
	draw_light_define_ambient(amb);
}