function screen_draw() {
	gpu_set_blendenable(false);
	draw_surface_ext(application_surface, 0, 0, 1, 1, 0, c_white, 1);
	gpu_set_blendenable(true);
}