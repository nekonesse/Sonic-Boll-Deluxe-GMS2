if (keeprunes) {
    with (runes) if (!_runesFade) event_user(0)
    with (runes) if (_runesFade) event_user(0)
} else {
    gpu_set_blendmode(bm_subtract)
    rect(global.view_xview-1,global.view_yview-1,global.view_wview+2,global.view_hview+2,color,0.5)  //intel graphics performing unnecessary alpha test
    gpu_set_blendmode(bm_add)
    rect(global.view_xview-1,global.view_yview-1,global.view_wview+2,global.view_hview+2,0,1)
    gpu_set_blendmode(0)
}

if (keepborder) {
	draw_sprite(spr_border,0,0,global.view_yview)
    with (mmicon) if (image_index=5 || image_index=7) event_perform(ev_draw,0) 
    //with (rosteroptions) event_perform(ev_draw,0)
    if (goto=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
    draw_sprite_ext(spr_border,0,0,global.view_yview,1,1,0,$ffffff,v)
    if (goto!=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
	with (genericcursor) draw_self();
}