///room_goto_safe(room)
//makes sure it's safe to change rooms before doing so
function room_goto_safe(_room){
	if (!globalmanager.fadekill && !global.kill) {
	    instance_activate_all()
	    if (global.lemontest /*&& room!=lemon && room!=change && argument[0]!=change*/) room_goto(room)
	    else room_goto(_room)
	    global.restarting=0
	}
}

///segafadeto(room,[sound])
function segafadeto(_room,_sound=-1,_keepborder=0,_keepmusic=0,_keeprunes=0,_fade_in=1) {
	instance_destroy(segafadein)
	
	/*if (room=game && skindat("nofade")) {
	    room_goto_safe(argument[0])
	    return 1
	}*/

	if (!instance_exists(segafade)) {
	    //if (argument_count=2) _sound(argument[1])
	    with (instance_create_depth(0,0,0,segafade)) {
			goto=_room
			keepborder=_keepborder
			keepmusic=_keepmusic
			keeprunes=_keeprunes
			fade_in=_fade_in
		}
	    return 1
	}

	return 0
}