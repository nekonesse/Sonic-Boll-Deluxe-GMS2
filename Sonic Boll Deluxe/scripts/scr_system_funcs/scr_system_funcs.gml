#macro gametitle "Sonic Boll Deluxe"
#macro version "2.2"
#macro margin 1/256
#macro verybignumber 999999999
#macro assetdepth 1000003
#macro root12of2 1.05946309436
#macro root2times16 22.5
#macro qt chr(34)
#macro lf chr(13)+chr(10)

function system_start(){
	application_surface_draw_enable(false);
	
	global.s=3
	
	window_set_size(400*global.s,224*global.s)
	window_center();
	
	//set up game directories and caches
	global.workdir=working_directory+"\\"
	global.tempdir=temp_directory+"\\"

	global.savedir=global.workdir+"save\\"
	directory_create(global.savedir)
	
	var savestring = global.savedir+gametitle
	if debug_mode savestring+="_DEBUG"
	global.savefile=savestring+".cfg"
	
	global.cache=global.savedir+"cache\\"

	global.tmpfile=global.tempdir+"res.gms"
	global.tasfile=global.tempdir+"tas.gms"
	
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	vertex_format_add_color();
	var vertex_format = vertex_format_end();
	var _temp=buffer_load("boll.vbuff")
	global.boll = vertex_create_buffer_from_buffer(_temp, vertex_format);
	buffer_delete(_temp);

	//globals
	global.sysfont=spr_sysfont
	global.fontmapbase="" for (i=1;i<128;i+=1) global.fontmapbase+=chr(i) 
    global.fontmap=global.fontmapbase//+lang("charmap")
	global.blastmap=""
	for (var i=65;i<91;i+=1) {
	global.blastmap+=chr(i)
	}
	for (var i=48;i<59;i+=1) {
	global.blastmap+=chr(i)
	}
	global.blastmap+=chr(46)
	global.blastmap+=chr(32)
	global.sprfont=-1
	global.tscale=1
	
	global.langstruct={};

	global.debug=debug_mode
	global.gamemaker=(program_directory!=working_directory)
	//global.easter=calceaster() || (date_get_month(date_current_datetime())=4 && date_get_day(date_current_datetime())=1)
	global.christmas=(date_get_month(date_current_datetime())=12 && date_get_day(date_current_datetime())=25)

	global.setmap=ds_map_create()
	global.strmap={};
	global.statmap=ds_map_create()
	global.timemap=ds_map_create()
	global.maptype=0; //for settings, set to 1 to write to time attack map instead (avoids duplicate function)
	global.spentblocks=ds_map_create()   
	global.keylog=buffer_create(10000,buffer_grow, 1)

	global.defaultkeyboard[0]=string(vk_up)+"|"+string(vk_down)+"|"+string(vk_left)+"|"+string(vk_right)+"|"+string(ord("X"))+"|"+string(ord("Z"))+"|"+string(ord("C"))+"|"+string(vk_enter)+"|"+string(ord("A"))+"|"+string(ord("S"))+"|"+string(ord("D"))+"|"+string(ord("V"))+"|"
	global.defaultkeyboard[1]=string(ord("I"))+"|"+string(ord("K"))+"|"+string(ord("J"))+"|"+string(ord("L"))+"|"+string(ord("W"))+"|"+string(ord("Q"))+"|"+string(ord("E"))+"|"+string(vk_backspace)+"|"+string(ord("1"))+"|"+string(ord("2"))+"|"+string(ord("3"))+"|"+string(ord("R"))+"|"

	global.kill=0
	global.restarting=0
	global.quietyou=0       
	global.lastroom=room
	global.replaycache=-1
	global.bmovie=-1
	global.w=400
	global.h=224
	global.mplay=0
	global.fool=0 
	global.electric=0
	global.bgscroll=0
	global.frameskipcounter=0
	global.editpicked=-1
	global.ref=-1
	global.refx=0
    global.refy=0
	global.pfps=60
	global.spd=60
	global.vapor=0
	global.vaporkek=0
	global.vaporpass=0
	global.steamprompt=0
	global.lastcmd=""
	global.lastrun="show_message("+qt+"hello world"+qt+")"
	global.lemonfilename=""
	global.levelfname=""
	global.lemontest=0
	global.lemontestviewhack=0
	global.actually_recording_goddamnit=0
	global.tasing=0
	global.pos=1
	global.length=1
	global.inputwait=0
	global.mousebacklock=0
	global.tcalc=0
	global.halign=0
	global.valign=0
	global.loadstate=0
	global.loadtime=0
	global.undocount=0
	global.specialestr="S# ´`\/O.:t%@!bB123FT"
	/*global.plattable=
	    "a0000000000a000a000a0a00a0a0a0aa0a0aaa0aaa0aaaaaa0aaaaabaaaaaaab"+
	    "aaabaabaababababababbababababaabaabaaabaaaabaaaaaaaaaaaa0aaaaa0a"+
	    "aa0aa0a0a0a0a0a0a00a00a00a00000a000000c00000000c000c000c0c00c0c0"+
	    "c0cc0c0ccc0ccc0cccccc0cccccdcccccccdcccdccdccdcdcdcdcdcddcdcddcd"+
	    "cdcdccdccdccdcccdcccccccccccccccccc0cccc0cc0cc0c0c0c0c0c0c00c00c"+
	    "0000c00000000000a0000000a0000000a0000000a0000000a0000000a0000000"*/

	//for (i=0;i<4;i+=1) {
	//    global.playermask[i]=sprite_create_from_screen(0,0,96,96,0,0,48,82)
	//}

	//final preparations
	draw_set_color($ffffff)
	draw_set_circle_precision(64)

	//instance_create(0,0,lemongrab)

	var rm=room_first 
	do {
		if rm!=lemon {
		    room_set_view_enabled(rm,1)
		    room_set_width(rm,1)
		    room_set_height(rm,1)
		}
	    rm=room_next(rm)
	} until (rm=-1)
	
	room_set_height(lemon,1536);
	room_set_height(lemon,864);

	//screen_init()

	var setting_load;

	setting_load = loadopt()
	/*if !setting_load {
	    setlang() //should prevent the game from having No Language if settings fail to load
	}*/
	stats("bootups",stats("bootups")+1)
	langdefault();
}

function system_step() {
	global.roomTimer++;
	//less function calls
	global.view_xview=camera_get_view_x(view_camera[0]);
	global.view_yview=camera_get_view_y(view_camera[0]);
	global.view_wview=camera_get_view_width(view_camera[0]);
	global.view_hview=camera_get_view_height(view_camera[0]);
	
	if (keyboard_check_pressed(vk_escape) && !instance_exists(console)) menu_cancel();
}