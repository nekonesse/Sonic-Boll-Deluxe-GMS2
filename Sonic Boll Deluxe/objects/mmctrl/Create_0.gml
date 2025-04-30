depth=3
with (instance_create_depth(global.view_wview/2,global.view_hview/2,0,genericcursor)) {
    image_blend=$ffffff
    special=1
}

/*if (global.lastroom==ta_results)
    game_reset()
else if (global.lastroom!=roster && global.lastroom!=options && global.lastroom!=trophies && global.lastroom!=modloader && global.lastroom!=replays) {
    game_reset()
    if (egg()) mus_play("_optionsc",1) 
    else menumusic()
}*/

global.quietyou=0
global.bundled=0
global.creditsroll=0

lock=0

//joy_detect()
//discord_update_presence("","In Menu","boll-icon","")