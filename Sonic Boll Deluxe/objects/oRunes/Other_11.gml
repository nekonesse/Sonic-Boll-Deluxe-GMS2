if (_runesFade)
if (surface_exists(_runesSurface))
draw_surface_ext(_runesSurface, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, $ffffff, (1-other.v)*_alpha);