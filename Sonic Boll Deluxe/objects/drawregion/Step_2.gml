/*if (global.view_wview!=width || global.view_hview!=height) {
    width=global.view_wview
    height=global.view_hview
    
    surface_free(surf)
    surface_free(surf2)
}*/

if (editcursor.middlep) {
	grabx=viewx
    graby=viewy
    grabcx=editcursor.x
    grabcy=editcursor.y
	grab=true
}

if (grab) {
    //grab the view
    var memx=viewx
    var memy=viewy
    viewx=grabx-(grabcx-editcursor.x)
    viewy=graby-(grabcy-editcursor.y)
    //if (viewx!=memx || viewy!=memy) event_user(7)
    if (!editcursor.middle) grab=0
    //bgslide=grabslide+(grabcx-editcursor.x)/2
}

#region Canvas Rendering
if !surface_exists(surf) {
	surf=surface_create(viewwidth, viewheight)
	update=1
}

/*if !(surface_set_target(surf)) exit;
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

surface_reset_target();*/
#endregion

var zoom_margin=editzoom.level
curs_in=point_in_rectangle(editcursor.x,editcursor.y,viewx+16*zoom_margin, viewy+16*zoom_margin, viewx+((viewwidth-16)*zoom_margin), viewy+((viewheight-16)*zoom_margin))

gridx=round(((editcursor.x-(24*zoom_margin)-viewx)/(16*zoom_margin)))
gridy=round(((editcursor.y-(24*zoom_margin)-viewy)/(16*zoom_margin)))

if (curs_in && editcursor.left) {
	switch(editcursor.tool) {
		case 0: { 
			if lemongrab.deities[$ $"obj{region}"][# gridx, gridy]!=hotbar.obj[hotbar.cur] {
				lemongrab.deities[$ $"obj{region}"][# gridx, gridy]=hotbar.obj[hotbar.cur]
				update=1
			}
		} break;
	}
}