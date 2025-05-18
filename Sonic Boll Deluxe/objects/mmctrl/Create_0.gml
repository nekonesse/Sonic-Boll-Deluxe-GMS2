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

if !fmod_channel_control_is_playing(global.mushandle)
global.mushandle=fmod_system_play_sound(global.snd[$ "_options"],false)

global.quietyou=0
global.bundled=0
global.creditsroll=0

lock=0

//joy_detect()
//discord_update_presence("","In Menu","boll-icon","")