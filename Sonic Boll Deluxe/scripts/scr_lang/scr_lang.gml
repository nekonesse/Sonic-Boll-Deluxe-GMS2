function langdefault(){
	//default language map 

	var m;
	m=global.strmap

	global.sysfont=spr_sysfont

	addlang(m,"name","English")
	             
	addlang(m,"charmap","#################################¡########ª«#########µ####º»#≤≥¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ#ÑÒÓÔÕÖ##ÙÚÛÜ##ßàáâãäåæçèéêëìíîï#ñòóôõö##ùúûüý#ÿ") //you need to god damn Tell the time
	
	addlang(m,"menu start","Press Any Button")
	
	addlang(m,"first","Hey there! Looks like this is the first time you launch the game. Hit F1 to learn more about each screen.##If you need instructions on how to get through the game, check out the enclosed instruction book.")
	addlang(m,"first skin","Looks like you've just changed your character's skin for the first time.#Skins change how the character looks, but they don't change the gameplay!")
	
	addlang(m,"stats page","PAGE")
	
	addlang(m,"opts key","       KEYBOARD")
	addlang(m,"opts joy","       GAMEPAD")
	addlang(m,"key name","KEYBOARD: ")
	addlang(m,"key set","SET KEYS") 
	addlang(m,"joy set","SET BUTTONS")
	addlang(m,"key end","SAVE AND RETURN")   
	addlang(m,"key cancel","CANCEL")   
	addlang(m,"key reset","RESET BINDINGS (F6)")   
	
	addlang(m,"up","UP")
	addlang(m,"down","DOWN")
	addlang(m,"left","LEFT")
	addlang(m,"right","RIGHT")
	addlang(m,"jump","JUMP")
	addlang(m,"action","ACTION")
	addlang(m,"alt","ALT")
	addlang(m,"start","START")
	addlang(m,"resetbut","RESET")
	
	addlang(m,"pause","P A U S E")                 
	addlang(m,"pause quit ask","Quit Game?")
	addlang(m,"pause resume","Resume")
	addlang(m,"pause back","Back")
	addlang(m,"pause skip","Skip stage")
	addlang(m,"pause retry","Retry stage")
	addlang(m,"pause window","Window")
	addlang(m,"pause volume","Balance")
	addlang(m,"pause quit","Quit")
	
	addlang(m,"mm 0","Start Game")
	addlang(m,"mm 1","Go Back")
	addlang(m,"mm 2","Quick Play")
	addlang(m,"mm 3","Configuration")
	addlang(m,"mm 4","Find Out More...") 
	addlang(m,"mm 5","Exit Game")
	addlang(m,"mm 6","Level Editor")
	addlang(m,"mm 7","Staff Roll")
	addlang(m,"mm 8","Mod Loader")                   
	addlang(m,"mm 9","Replays")
	addlang(m,"mm 10","Twitter")
	addlang(m,"mm 11","Discord")
	addlang(m,"mm legends","Press %jump% to jump.")
	
	addlang(m,"cog menu","Match Options")
	addlang(m,"cog mirror","Mirror Mode")
	addlang(m,"cog ratchet","Screen Ratchet")
	addlang(m,"cog random blocks","Random Items")
	addlang(m,"cog infinite lives","Infinite Lives")
	 
	addlang(m,"roster ready","Press Start!")  
	addlang(m,"roster cast","Main Cast: ")
	addlang(m,"roster charmcast","Character Mods: ")
	addlang(m,"stage ready","GO!")
	addlang(m,"tasready","Press START when ready")
	
	addlang(m,"replays","Replays")
	
	addlang(m,"mods","Mod Loader")
	addlang(m,"mod folder","Open folder")
	addlang(m,"mod enable","Enabled")
	addlang(m,"mod broken","This charm file contains errors and is disabled, check errors.txt for more information.")
	addlang(m,"mod ok","Loaded")
	addlang(m,"mod no","Disabled")
	addlang(m,"mod bk","Broken")
	
	addlang(m,"default music","Load from#world skin")
	addlang(m,"default levels","Base game#levels")
	
	addlang(m,"stage screen","Choose World")
	addlang(m,"stage screen2","Next Stage")
	addlang(m,"stage mode 0","Sequence")
	addlang(m,"stage mode 1","Choose")
	addlang(m,"stage mode 2","Shuffle") 
	
	addlang(m,"bundle screen","Select Bundle")
	 
	addlang(m,"score title","RESULTS")
	addlang(m,"score final title","FINAL RESULTS")
	addlang(m,"score wins","WINS!")
	addlang(m,"score ties","TIED - TRY AGAIN!") 
	addlang(m,"score 0","Score")
	addlang(m,"score 1","Enemies")
	addlang(m,"score 2","Blocks")
	addlang(m,"score 3","Coins")
	addlang(m,"score 4","TotCoin")
	addlang(m,"score 5","Time")
	addlang(m,"score 6","Items")
	addlang(m,"score 7","Frags")
	addlang(m,"score 8","Deaths")
	addlang(m,"score 9","Perfect")
	
	addlang(m,"unlock kid","You unlocked##The Kid!")
	addlang(m,"unlock super","You unlocked##Super Sonic!")
	addlang(m,"unlock ashura","You unlocked##Ashura!")
	
	addlang(m,"tip world","Press %jump% to jump. %action% is the run and fire button.")
	addlang(m,"tip main menu","Click one of the icons to select a mode. You can use the mouse or any of the gamepads.")
	addlang(m,"tip options","Change the game options here. Check the manual for keyboard shortcuts.")
	addlang(m,"tip replays","Recorded matches show up here where you can watch them play back.##Hit F12 to hide the replay UI.")
	addlang(m,"tip roster","Click a character card to pick it. Click or hold on the player box to change skins.")
	addlang(m,"tip stage select","You can right click or press b on a world skin to use that skin as a music pack.")
	addlang(m,"tip optfilter","Choose video filter mode.##Performance is unaffected.")
	addlang(m,"tip optvideo","Choose your preferred window size.##You can press F11 or F4 to change this at any time.")
	addlang(m,"tip optextract","Extracts the game's base assets so you can use them as examples to make mods and skins.")
	addlang(m,"tip optstats","View your personal game statistics.")
	addlang(m,"tip optkey","Change button mappings for keyboards 1 and 2.")
	addlang(m,"tip optjoy","Change gamepad button mappings for all connected gamepads.")
	addlang(m,"tip optegg","Disables all random jokes and easter eggs.##Useful for streaming!")
	addlang(m,"tip optdiscord","Choose wether or not to display your activity to your Discord profile.##You may notice some delay when toggling the setting.")
	addlang(m,"tip optvol","Increase or decrease the volume of sound effects.")
	addlang(m,"tip optmusvol","Increase or decrease the volume of background music.")
	addlang(m,"tip optassets","Removes decorations and some background elements to increase performance.")
	addlang(m,"tip optlang","Choose user interface language.##This does not affect text on levels.")
	addlang(m,"tip optdetail","Reduces background update speed to 30 fps for better performance.")
	addlang(m,"tip optmusic","You can choose an audio file to use as custom menu music.")
	addlang(m,"tip optmusic2","Custom menu music:#")
	addlang(m,"tip optpause","Choose if the game can automatically pause when it's not the foreground window.")
	addlang(m,"tip optcamshim","Changes how much the camera extends while doing certain actions.")
	
	addlang(m,"tip unlock ashura","What happens in the minus world?")
	addlang(m,"tip unlock super","The 7 Chaos Emeralds hold a mysterious power...")
	addlang(m,"tip unlock kid","Have you ever gone the wrong way?")
	addlang(m,"tip unlock dio","How many breads have you eaten in your life?")
	
	addlang(m,"tfp_1"," Thanks for playing Boll Deluxe! This is## the last release before we develop a## new engine, but here are several things## you can do to tide you over:")
	addlang(m,"tfp_2","1.Visit the website at:##  https://boll-team.itch.io/boll-deluxe")
	addlang(m,"tfp_3","2.Poke around the modding general section##  of our discord server. There you can##  download homebrewn levels, characters,##  and more!")
	addlang(m,"tfp_4","3.Stop by to chat in our discord server##  in general! The place is never empty,##  and it's also a great way to find##  people to play a netgame with.")
	addlang(m,"tfp_5"," Returning to the title screen...")
	
	addlang(m,"error bundles","No bundles were found.##Place your bundles here:##")
	addlang(m,"error identical gamepads","You have identical controllers. Changing the settings for one of them will affect the other ones.")
	addlang(m,"error press","Press F9 to screenshot, Escape to#exit or any other key to continue:")
	addlang(m,"error crash press","Press F9 to screenshot,#or any other key to exit.")
	addlang(m,"error skin type","Invalid skin type: ")
	addlang(m,"error skin string","Missing skin string: ")
	addlang(m,"error movie corrupt","Movie data is corrupt.")
	addlang(m,"error movie charm","Error loading movie:##Movie contains charm character '")
	addlang(m,"error movie charm 2","', which is not installed.")
	addlang(m,"error no joy config","There are no connected gamepads.")
	addlang(m,"error skin dimensions","Incorrect image dimensions loading skin.")
	addlang(m,"error skin thicc","Skin texture too large, loading failed.")
	addlang(m,"error world icon size","Skin icons must be 96x48: ")
	addlang(m,"error bundle icon size","Bundle icons must be 96x96: ")
	addlang(m,"error skin corrupt","Found corrupt image loading skin.")                                         
	addlang(m,"error next version","This content is not yet available. Check next version.")
	addlang(m,"error too many","Only 4 players can join.")
	addlang(m,"error crash","Looks like the game had errors last time. Please send the crash logs to us on Discord so we can fix them.")
	addlang(m,"error steam desktop controller","Seems like you have Steam or joy2key interfering with your keyboard. Please disable those programs since they're not necessary here.")                             
	addlang(m,"error bundle missing","This bundle is missing either a level pack or a world skin and can't be used.")
	addlang(m,"error lemon version","The loaded lemon file is corrupt and can't be used.")
	addlang(m,"error lemon converted","The loaded lemon file is an old format and has been converted. Some objects may be missing.")

	//Generic Errors
	
	

	addlang(m,"error charmload1", "Error loading charm:##")
	addlang(m,"error charmmal", "##Potentially malicious code is in this charm.#Please remove this code to use this charm.")
	addlang(m,"error codeblock1", "Error executing code#in object ")
	addlang(m,"error codeblock2", "##Forbidden keyword detected:##")
	addlang(m,"error codeblock3", "##For safety reasons, please remove this keyword from your code in order to run it.")
	addlang(m,"error fatal" /*@ anarack warriprs*/, "Unexpected error.##The game will now close.")
	addlang(m,"error sureface1","The game failed to create a drawing surface of size ")
	addlang(m,"error sureface2",".##Your system may be low on memory.##The game will now close.")
	addlang(m,"error lowram","intentional crash due to low video ram")
	addlang(m,"error text workdir1","Error loading file:##")
	addlang(m,"error text workdir2","##This file is not located within the game directory#and will not be loaded for safety reasons.")
	addlang(m,"error text unopenable1","File failed to load:##")
	addlang(m,"error text unopenable2","##The file may not be openable, or it can't be#created in this location.")
	addlang(m,"error exception1","Unknown exception found: '")
	addlang(m,"error exception2","'##This biome will be converted to Ground.")
	addlang(m,"error lemon corrupt","Lemon file may be corrupted and cannot be opened:##")
	addlang(m,"error lemon biome1","Invalid biome name found:##")
	addlang(m,"error lemon biome2","##Please re-save the level in Lemon.")
	addlang(m,"error missing level", "Level file not found:##") 
	addlang(m,"error icon dimensions", "charm icon not 24x24:##")
	addlang(m,"error charm nocode", "##This charm doesn't contain any code.")
	addlang(m,"error bio dimensions", "charm bio not 48x48 or a multiple:##") 
	addlang(m,"error vanilla broken", "Charm error with character in vanilla folder:##")
	addlang(m,"error text write1", "Error writing to file:##")
	addlang(m,"error text write2", "##For safety reasons, you cannot write this keyword to the file.")

	//Gamemode
	
	

	addlang(m,"gamemode classic", "CLASSIC")
	addlang(m,"gamemode battle", "BATTLE")
	addlang(m,"gamemode timeattack", "TIME-ATTACK")
	addlang(m,"gamemode coop", "CO-OP")

	//Time Attack
	

	addlang(m,"ta_results", "RESULTS")
	addlang(m,"ta_cheater", "TIME HAS NOT BEEN SAVED")
	addlang(m,"ta_time0", "Top Level Times:")
	addlang(m,"ta_time1", "Top Character Times:")
	addlang(m,"ta_yourtime", "Your Time:")
	addlang(m,"ta error too many", "Only 1 player can join Time Attack mode.")

	//Character Door
	
	addlang(m,"game where char", "Character not found. Is this character downloaded?")
	addlang(m,"game already char", "You are already playing as this character!")

	
}

function addlang(strmap, key, text) {
	strmap[$ key]=text
}

function lang(key) {
	return global.strmap[$ key]
}