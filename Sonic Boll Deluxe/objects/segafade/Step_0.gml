if (go) {/*if (!linked) {mus_stop() mus_volume(1)}*/
	if (fade_in)
	with(instance_create_depth(0,0,0,segafadein)) {
		keepborder=other.keepborder
		keeprunes=other.keeprunes
		keepmusic=other.keepmusic
	}
	if !(keeprunes) instance_destroy(runes);
	if !(keepmusic) {
		fmod_sound_group_stop(global.musgroup);
	}
	fmod_sound_group_set_volume(1);
	room_goto_safe(goto)
}

//linked=keepmusic || (skindat("deathmusic") && room=game)
if (slow)                v+=(0.06+(v<0.5)*0.06)*0.05
else if (room=titlescreen)     v+=(0.06+(v<0.5)*0.06)*0.3
else                     v+=(0.06+(v<0.5)*0.06)*0.6
if (v>1) {v=1 go=1}
else if (!keepmusic) fmod_sound_group_set_volume(global.musgroup,1-v)
color=merge_color(merge_color(0,$80ffff,min(1,v*2)),$ffffff,max(0,(v-0.5)*2)) 