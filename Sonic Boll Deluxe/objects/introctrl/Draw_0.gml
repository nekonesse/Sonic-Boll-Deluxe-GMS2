if cango {
	shader_set(shd_outline)

	var texture = surface_get_texture(boll)
	var u_outline_color = shader_get_uniform(shd_outline,"outlineColor");
	var t_width = texture_get_texel_width(texture)
	var t_height = texture_get_texel_width(texture)

	shader_set_uniform_f(sh_texel_handle, t_width, t_height)
	shader_set_uniform_f(u_outline_color,0,0,0,1.0);
}
draw_surface_stretched(boll,x-180*vs,floor(y-180*is),360*vs,360*is)
shader_reset();