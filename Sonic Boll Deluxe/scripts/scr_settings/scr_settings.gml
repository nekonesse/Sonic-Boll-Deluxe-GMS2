function settings() { //key, value
	//settings registry. specifying a value writes to it.

	var map, check, type;
	check=undefined
	type=global.maptype global.maptype=0
	
	switch type {
		case 1: map=global.statmap break;
		case 2: map=global.timemap break;
		default: map=global.setmap break;
	}

	if (argument_count=1) {
	    if (ds_map_exists(map,argument[0])) return ds_map_find_value(map,argument[0])
		else return 0
	} else {
	    if (ds_map_exists(map,argument[0])) ds_map_replace(map,argument[0],argument[1])
	    else ds_map_add(map,argument[0],argument[1])
	    global.settingschanged=1
		show_debug_message("just wrote to map "+string(type))
	}
}

function applysettings() {
	//unpackkeyboard() //Fun

	//setlang() 

	//volumehandler()                

	ds_map_read(global.statmap,settings("statmapL"))

	//if (room!=boot) windowhandler()
}

function stats(key) {
	global.maptype=1
	if argument_count>1 return settings(key, argument[1])
	else return settings(key)
}

function ta_set(key) {
	global.maptype=2
	if argument_count>1 return settings(key, argument[1])
	else return settings(key)
}

function loadopt() {
	///loadopt()
	//loads settings from file

	var f,str,k,temp;

	loaddefault()

	global.settingschanged=0

	if (file_exists(global.savedir+"times.cfg")) {
	    f=file_text_open_read(global.savedir+"times.cfg")
	    str=file_text_read_string(f)
	    file_text_close(f)
    
	    temp=ds_map_create()
    
	    if (!ds_map_read(temp,str)) {ds_map_destroy(temp)}
	    else {
	        k=ds_map_find_first(temp)
	        repeat (ds_map_size(temp)) {
	            ta_set(k,ds_map_find_value(temp,k))
	            k=ds_map_find_next(temp,k)
	        }                    
	        ds_map_destroy(temp)            
	    }     
	}

	if (file_exists(global.savefile)) {
	    f=file_text_open_read(global.savefile)
	    str=file_text_read_string(f)
	    file_text_close(f)
	    if (string_length(str)<16) return 0
    
	    temp=ds_map_create()
    
	    if (!ds_map_read(temp,str)) {ds_map_destroy(temp) return 0}
	    else {
	        if (!is_string(settings("version"))) {ds_map_destroy(temp) return 0}
	        else if (settings("version")!=gameversion) {ds_map_destroy(temp) return 0}
	        else {
	            k=ds_map_find_first(temp)
	            repeat (ds_map_size(temp)) {
	                settings(k,ds_map_find_value(temp,k))
	                k=ds_map_find_next(temp,k)
	            }                    
	            ds_map_destroy(temp)            
	        }
	    }     
	}

	applysettings()
	return 1	
}

function saveopt() {
	var f;
	if (global.settingschanged) {   
	    settings("statmapL",ds_map_write(global.statmap))
	    f=file_text_open_write(global.savefile)
	    file_text_write_string(f,ds_map_write(global.setmap))
	    file_text_close(f)
    
	    f=file_text_open_write(global.savedir+"times.cfg")
	    file_text_write_string(f,ds_map_write(global.timemap))
	    file_text_close(f)
	}
}
function loaddefault() {
	settings("version",gameversion)
	settings("volbalance",0.5)
	settings("musbalance",0.5)
	settings("keyboard1",string(vk_up)+"|"+string(vk_down)+"|"+string(vk_left)+"|"+string(vk_right)+"|"+string(ord("X"))+"|"+string(ord("Z"))+"|"+string(ord("C"))+"|"+string(vk_enter)+"|"+string(ord("A"))+"|"+string(ord("S"))+"|"+string(ord("D"))+"|"+string(ord("V"))+"|")
	settings("keyboard2",string(ord("I"))+"|"+string(ord("K"))+"|"+string(ord("J"))+"|"+string(ord("L"))+"|"+string(ord("W"))+"|"+string(ord("Q"))+"|"+string(ord("E"))+"|"+string(vk_backspace)+"|"+string(ord("1"))+"|"+string(ord("2"))+"|"+string(ord("3"))+"|"+string(ord("R"))+"|")
	settings("zoom",3)
	settings("zoomlemon",1)
	settings("playstages",8)
	settings("language","")
	settings("wskinpin","")  
	settings("mskinpin","")  
	settings("lskinpin","")  
	settings("dequanto",0)
	settings("discord",0) //evil and intimidating string using ' ' characters:
	settings("autopause",1)
	settings("menumusic","")
	settings("lemonmusic","")
	settings("edit autosave",1) 
	settings("detail",0)
	settings("camshimmie",0)
	settings("lock ashura",1)
	settings("lock super",1)

	var i=0;
	repeat (9) {
	    settings("contest"+string(i),1)
	    settings("contestbkp"+string(i),1)
		i++
	}	
}