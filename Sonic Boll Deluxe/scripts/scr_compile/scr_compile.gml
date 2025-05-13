function compile_code(){
	var index = 0
	var _compiled = ds_map_create();
	var def_names = []
	var	found_folders = []
	
	show_debug_message("BEGIN SCRIPT COMPLATION...")
	
	var _folder = file_find_first($"{working_directory}\\vanilla\\scripts\\*", fa_directory)
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
	
	show_debug_message("LETS DO IT AGAIN!!")
	
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
				show_debug_message(store)
				//show_message(store);
			
				if !is_undefined(_compiled[? store]) {
					show_message("WARNING: `" + store + "` already has a script compiled.")
				}
			
				var ast = GMLspeak.parseString(global._loopThrough(def_names[i], _filepath));
				_compiled[? store] = GMLspeak.compileGML(ast);
				show_message(_compiled[? store])
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