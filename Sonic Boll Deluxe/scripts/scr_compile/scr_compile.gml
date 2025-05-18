function compile_code(){
	var index = 0
	var _compiled = ds_map_create();
	var def_names = []
	var	found_folders = []
	
	show_debug_message("BEGIN SCRIPT COMPLATION...")
	
	/*var _folder = file_find_first($"{working_directory}\\vanilla\\scripts\\*", fa_directory)
	while(_folder != "") {
		
		show_debug_message("SCRIPT FOLDER FOUND! `" + _folder + "`");
		
		if string_starts_with(_folder, "!") {
			show_debug_message("WARNING: Terminate symbol found in `" + _folder + "`. Ignoring...");
			_folder = file_find_next();
		}else {
			found_folders[index++] = "scripts\\" + _folder
			_folder = file_find_next();
		}
	}
	show_debug_message("END SCRIPT FOLDER SEARCH");
	
	_folder = file_find_close();
	
	show_debug_message("LETS DO IT AGAIN!!")*/
	
	var _folder = file_find_first($"{working_directory}\\vanilla\\character\\*", fa_directory)
	while(_folder != "") {
		
		show_debug_message("SCRIPT FOLDER FOUND! `" + _folder + "`");
		
		if string_starts_with(_folder, "!") {
			show_debug_message("WARNING: Terminate symbol found in `" + _folder + "`. Ignoring...");
			_folder = file_find_next();
		}else {
			found_folders[index++] = "character\\" + _folder
			_folder = file_find_next();
		}
	}
	show_debug_message("END SCRIPT FOLDER SEARCH");
	
	_folder = file_find_close();
	
	var j=0;
	repeat(array_length(found_folders)) {
		
		var _file = file_find_first($"{working_directory}\\vanilla\\" + found_folders[j] + "\\*.gml",0)
		show_debug_message("BEGIN SCRIPT COMPILE IN `" + found_folders[j] + "`");
	
		while(_file != "") {
			show_debug_message("SCRIPT FILE FOUND! `" + _file + "`");
			
			var _filepath = $"{working_directory}\\vanilla\\" + found_folders[j] + "\\" + _file
			//var _filepath2 = $"{working_directory}\\vanilla\\scripts\\" + _folder 
			show_debug_message(_filepath)
			//show_debug_message(_filepath2)
			_file = string_delete(_file, string_length(_file) -3, 4)
			def_names = global._findDefine( _filepath)
			var i=0;
			repeat(array_length(def_names)) {
			
				var store = _file + "_" + def_names[i]
			
				if !is_undefined(_compiled[? store]) {
					show_message("WARNING: `" + store + "` already has a script compiled.")
				}
			
				var ast = GMLspeak.parseString(global._loopThrough(def_names[i], _filepath));
				_compiled[? store] = GMLspeak.compileGML(ast);
				i++;
			}
			
			show_debug_message("END SCRIPT EXTRACT IN FILE " + _file);
			_file = file_find_next();

		}
		
		show_debug_message("END SCRIPT COMPILE IN FOLDER " + found_folders[j]);
		_file = file_find_close();
		j++;
	}
	
	show_debug_message("Scripts have finished being compiled")
	
	return _compiled
}

function import_sheets() {
	show_debug_message("BEGIN SPRITE COMPILATION...")
	gamemanager.PlayerColl.StartBatch();
	var i=0;
	repeat(array_length(global._playerChars)) {
		var _name = global._playerChars[i]; 
		var dir=$"{working_directory}\\_vanilla\\character\\{_name}"
		
		var _name = global._playerChars[i];
		global.animdat[i]=[];
		var dir=$"{working_directory}\\_vanilla\\character\\{_name}"
		var buffer = buffer_load($"{dir}\\config.ini");
		var _string = buffer_read(buffer,buffer_string);
		buffer_delete(buffer);
		var retrieved_dat=json_parse(_string)
		global.animdat[i]=retrieved_dat;
		show_debug_message($"got animation data: {global.animdat[i]}")
		
		if file_exists($"{dir}\\sprites\\_HUDicon.png") {
			gamemanager.PlayerColl.AddFile($"{dir}\\sprites\\_HUDicon.png",$"spr_{_name}_HUDicon",1,false,false,CollageOrigin.CENTER,CollageOrigin.CENTER)
		} else throw $"SORRY! NO HUD ICON IN CHARACTER \"{_name}\" EXISTS! CHECK YOUR SPRITES!"
		
		if file_exists($"{dir}\\pal.png") {
			gamemanager.playerPalettes[i]=sprite_add($"{dir}\\pal.png",0,0,0,0,0)
		}
	
		get_sprite_frames(dir, global.player_spritelists[i])
		
		var spritedat=global.animdat[i][0]
		var framedat=global.animdat[i][1]
		var array=global.player_spritelists[i]
		var j=0;
		repeat(array_length(global.powerups)) {
			var sprite_yank = global.powerups[j]
			if spritedat[$ $"{global.powerups[j]} override"] != undefined {
					sprite_yank = spritedat[$ $"{global.powerups[j]} override"]
			}
			var g=0;
			repeat (array_length(array)) {
				if (array[g]!="_HUDicon") && file_exists($"{dir}\\sprites\\{sprite_yank}\\{array[g]}.png") { //make sure they arent trying to overwrite our HUD icon that we imported
					var frames=nozerounreal(framedat[$ $"{sprite_yank} {array[g]} frames"], framedat[$ $"{array[g]} frames"])
					var org_x=nozerounreal(framedat[$ $"{sprite_yank} {array[g]} orgx"],nozerounreal(framedat[$ $"{array[g]} orgx"], nozerounreal(framedat[$ "origin x"], CollageOrigin.CENTER)))
					var org_y=nozerounreal(framedat[$ $"{sprite_yank} {array[g]} orgy"],nozerounreal(framedat[$ $"{array[g]} orgy"], nozerounreal(framedat[$ "origin y"], CollageOrigin.CENTER)))
					gamemanager.PlayerColl.AddFile($"{dir}\\sprites\\{sprite_yank}\\{array[g]}.png",$"spr_{_name}_{global.powerups[j]}_{array[g]}",frames,false,false,org_x,org_y)
				}
				show_debug_message($"adding sprite {array[g]}")
				g++;
			}
			j++;
		}
		show_debug_message(global.player_spritelists[i])
		i++;
	}
	gamemanager.PlayerColl.FinishBatch();
	show_debug_message("Sprites have finished being compiled")
}

function compile_hud_sprites() {
	globalmanager.HUDColl.StartBatch();
	var i=0;
	repeat(array_length(global._playerChars)) {
		var _name = global._playerChars[i];
		var dir=$"{working_directory}\\vanilla\\character\\{_name}"
		if !directory_exists(dir) { //if it doesnt exist in vanilla, it must be a mod character
			dir=$"{working_directory}\\mods\\character\\{_name}"
		}
		
		var addhudsprite = function(fn, dir) {
			if file_exists($"{dir}\\{fn}.png") {
				globalmanager.HUDColl.AddFile($"{dir}\\{fn}.png",$"spr-{fn}",1,true,false,0,0)
			}
		}
		
		var fn;
		fn=$"{_name}-card"
		addhudsprite(fn,dir)
		fn=$"{_name}-emblem"
		addhudsprite(fn,dir)
		fn=$"{_name}-replay"
		addhudsprite(fn,dir)
		fn=$"{_name}-timeattack"
		addhudsprite(fn,dir)
		fn=$"{_name}-icon"
		addhudsprite(fn,dir)
		
		i++;
	}
	globalmanager.HUDColl.FinishBatch();
}