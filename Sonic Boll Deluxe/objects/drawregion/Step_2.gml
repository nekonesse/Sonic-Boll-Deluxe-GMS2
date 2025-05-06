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

if !surface_exists(surf)
surf=surface_create(viewwidth, viewheight)

if !(surface_set_target(surf)) exit;
draw_clear(c_black)
draw_clear_alpha(c_black,0)

rect(0,0,viewwidth,viewheight,c_black,0.5);
draw_sprite_stretched(tex_grid,0,16,16,viewwidth-32,viewheight-32);
surface_reset_target();

var zoom_margin=editzoom.level
curs_in=point_in_rectangle(editcursor.x,editcursor.y,viewx+16*zoom_margin, viewy+16*zoom_margin, viewx+((viewwidth-16)*zoom_margin), viewy+((viewheight-16)*zoom_margin))

gridx=round(((editcursor.x-(24*zoom_margin)-viewx)/(16*zoom_margin)))
gridy=round(((editcursor.y-(24*zoom_margin)-viewy)/(16*zoom_margin)))

if (curs_in && editcursor.leftp) {
	show_debug_message(editcursor.tool)
	switch(editcursor.tool) {
		case 0: { 
			var obj_arr=[hotbar.obj[hotbar.cur], gridx, gridy]
			array_push(lemongrab.deities[$ $"obj{region}"], obj_arr)
			show_debug_message(lemongrab.deities[$ $"obj{region}"])
		} break;
	}
}