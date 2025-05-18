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
	
	if _sound!=-1 && struct_exists(global.snd, _sound)
	fmod_system_play_sound(global.snd[$ _sound], false)
	
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

///mousecursor(init)
//allows the mouse to control the keyboard cursor
function mousecursor(init) {

	var window_size = camera_get_view_width(camera_get_active())/display_get_gui_width()

	var mx,my;
	mx=round(window_mouse_get_x()/window_size)
	my=round(window_mouse_get_y()/window_size)
	if mx!=x||my!=y{ if mybox { visible=1 } }
	if (canmouse) if (mx<-1 || my<-1 || mx>401 || my>225) exit

	if (init) {
	    x=global.view_xview+median(0,mx,global.view_wview)
	    y=global.view_yview+median(0,my,global.view_hview)
	    memx=mx
	    memy=my
	    memvy=view_yview[0]
	    canmouse=1

	} else {
	    if (mx!=memx || my!=memy || view_yview[0]!=memvy) {
			x=global.view_xview+median(0,mx,global.view_wview)
			y=global.view_yview+median(0,my,global.view_hview)
	        memx=mx
	        memy=my
	        memvy=global.view_yview
	    }
	    if (!instance_exists(blockmessage) && !instance_exists(console)) {
	        if (mouse_check_button(mb_left)) {akey=1} else if !input_check("jump", p2) akey=0
	        if (mouse_check_button(mb_right)) {bkey=1} else if !input_check("action", p2) bkey=0
			if (mouse_check_button_pressed(mb_left)) {abut=1} else if !input_check_pressed("jump", p2) abut=0
	        if (mouse_check_button_pressed(mb_right)) {bbut=1} else if !input_check_pressed("action", p2) bbut=0
	        if (mouse_wheel_down()) wdown=1 else wdown=0
	        if (mouse_wheel_up()) wup=1 else wup=0
	    }
	}
}

function input_clear() {
	akey=0 abut=0 arel=0
	bkey=0 bbut=0 brel=0
	ckey=0 cbut=0 crel=0
	skey=0 sbut=0 srel=0
	left=0 right=0 up=0 down=0
	xkey=0 xbut=0 xrel=0    
	ykey=0 ybut=0 yrel=0
	zkey=0 zbut=0 zrel=0 
	rkey=0 rbut=0 rrel=0
}

function input_get(_p2) {
	///input_get(method)
	//reads the input method and changes the local collection of button variables

	if ((instance_exists(blockmessage) && object_index!=blockmessage) || instance_exists(console)) exit

	up  = input_check("up", _p2)
	down= input_check("down", _p2)
	left= input_check("left", _p2)
	right=input_check("right", _p2)
	akey= input_check("jump", _p2)
	bkey= input_check("action", _p2)
	ckey= input_check("alt", _p2)
	skey= input_check("start", _p2)    
	xkey= input_check("custom1", _p2)
	ykey= input_check("custom2", _p2) 
	zkey= input_check("custom3", _p2) 
	rkey= input_check("reset", _p2)
	abut= input_check_pressed("jump", _p2)
	bbut= input_check_pressed("action", _p2)
	cbut= input_check_pressed("alt", _p2)
	sbut= input_check_pressed("start", _p2)    
	xbut= input_check_pressed("custom1", _p2)
	ybut= input_check_pressed("custom2", _p2) 
	zbut= input_check_pressed("custom3", _p2) 
	rbut= input_check_pressed("reset", _p2)
	arel= input_check_released("jump", _p2)
	brel= input_check_released("action", _p2)
	crel= input_check_released("alt", _p2)
	srel= input_check_released("start", _p2)    
	xrel= input_check_released("custom1", _p2)
	yrel= input_check_released("custom2", _p2) 
	zrel= input_check_released("custom3", _p2) 
	rrel= input_check_released("reset", _p2)

	//if (skindat("left") && instance_exists(gamemanager)) {tmp=left left=right right=tmp}

	if (global.inputwait) input_clear()
}

function menu_cancel() {
	if (instance_exists(console)) {console.off=1 exit}
	if (instance_exists(blockmessage)) {blockmessage.off=1 exit}

	if (room=mainmenu) segafadeto(titlescreen,"systemreturn")

	//if (room=speciale) with (moranboll) {
	//    sound("systemreturn")
	//    instance_destroy()
	//} 

	//if (room=boot || room=titlescreen || room=title || room=lemon || room=speciale) exit

	/*if (room=bundleroster) segafadeto(title,"systemreturn") 
	else if (room=change) {
	    if (global.gamemode="battle") segafadeto(results,"systemreturn")
	    else if (global.stagecount>0) segafadeto(scoring,"systemreturn")        
	    else segafadeto(titlescreen,"systemreturn")
	} else if (room=game) {
	    if (global.playback) segafadeto(replays)
	} else {
	    if (room=scoring || room=finalscore) {
	        if (global.gamemode="battle") segafadeto(results,"systemreturn")
	        else segafadeto(titlescreen)
	    }
	    if (room=results) {
	        if (global.playback) segafadeto(replays,"systemreturn")
	        else segafadeto(titlescreen)
	    }
	    */
	    if (room=options /*&& !instance_exists(keyconfig)*/) {saveopt() segafadeto(mainmenu,"systemreturn")}
	    /*if (room=replays || room=modloader || room=trophies || room=ta_results) segafadeto(mainmenu,"systemreturn")
	    if (room=roster) {if (rosterctrl.cog) {sound("systemreturn") rosterctrl.cog=0} else if (global.bundled) segafadeto(title,"systemreturn") else segafadeto(mainmenu,"systemreturn")}
	    if (room=stagesel || room=ta_menu) segafadeto(roster,"systemreturn")
	}*/
}

function modulo(value, lower, upper) {
	///modulo(value,lower,upper):value
	//keeps a value within supplied range warping in both ways (lower incl, upper excl)
	var o,d,w;

	o=lower
	d=value-o
	w=upper-o

	if (w=0) return o      
	return d-floor(d/w)*w+o
}



function instance_create(_x,_y,obj) { //instance_create function that calls instance_create_depth Mc pig's vision
	return instance_create_depth(_x,_y,0,obj)
}

function playercol() {
	//player color table

	switch (argument[0]) {
	    case 0: return $ffffff
	    case 1: return $aaaaaa              //keyboard
		
		/* //the 8 chaos joys will have to wait there is no "game pads" yet i think
	    case JOY:   return $ff              //joy 1
	    case JOY+1: return $c000            //joy 2
	    case JOY+2: return $ff6020          //joy 3
	    case JOY+3: return $b3ff            //joy 4
	    case JOY+4: return $ffff00          //joy 5
	    case JOY+5: return $dc00ff          //joy 6
	    case JOY+6: return $006aff          //joy 7
	    case JOY+7: return $ff0088          //joy 8
		*/
	}

	return $ffffff
}