instance_create_depth(0,0,0,editcursor)
instance_create_depth(0,0,0,drawregion)
instance_create_depth(0,0,0,lemongrab)
//instance_create_depth(0,0,0,tooltiplayer)
depth=1

//discord_update_presence("","In the Level Editor","boll-icon","lemon-icon")

/*if !(settings("nolemonmusic")) {
    if (egg()) mus_play("_optionsc",1) 
    else menumusic()
}*/

undocount=global.undocount
picked=-1

loadlemontabs(0)

//winding=FMODSoundAdd(environment_get_variable("windir")+"\Media\Windows Ding.wav",0) //winding gaster

autosave=""

autosave=global.savedir+"autosave.lemon"

tab=0

if autosave="" autosave=global.savedir+"autosave.lemon.png"

//if (settings("edit autosave")) alarm[0]=3600

alarm[1]=1