if (over && editcursor.leftp) {grab=1}
if (grab) {
    zoom=floor(median(0,editcursor.x-x-5,80)/16)
    if (!editcursor.left) grab=0
    center=1
    event_user(0)
}

h=keyboard_check_pressed(vk_pagedown)-keyboard_check_pressed(vk_pageup)
if (editcursor.ctrl && editcursor.scrw!=0) h=editcursor.scrw
if (h!=0) {
    zoom=median(0,zoom-h,5)
    center=0
    event_user(0)
}

var ol=level
level=approach_val(level,levelgo,0.1)
xd=approach_val(xd,xdgo,4)
if (level!=ol) {
    if (!center) {
        var offx=((drawregion.viewx+(drawregion.viewwidth/2))-editcursor.x)
        var offy=((drawregion.viewy+(drawregion.viewheight/2))-editcursor.y)
		show_debug_message($"{offx} {offy}")
		with(drawregion) {
			viewx-=(offx/ol)-offx/other.level
			viewy-=(offy/ol)-offy/other.level
		}
    }
}