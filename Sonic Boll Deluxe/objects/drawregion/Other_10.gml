if !(surface_set_target(surf)) exit;
draw_clear(c_black)
draw_clear_alpha(c_black,0)

rect(0,0,viewwidth,viewheight,c_black,0.5);
draw_sprite_stretched(tex_grid,0,16,16,viewwidth-32,viewheight-32);

//Object drawing
var i=0;
var grid=lemongrab.deities[$ $"obj{region}"]
repeat(ds_grid_width(grid)) {
	var j=0;
	repeat(ds_grid_height(grid)) {
		if grid[# i, j]!=0 {
			lemon_object_draw(grid[# i, j],i,j)
		}
		j++;
	}
	i++;
}

surface_reset_target();