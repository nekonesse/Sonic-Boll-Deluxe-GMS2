if (keeprunes) {
    with (runes) if (!fade) event_user(0)
    with (runes) if (fade) event_user(0)
} else {
    gpu_set_blendmode(bm_subtract)
    rect(camera_get_view_x(camera_get_active())-1,camera_get_view_y(camera_get_active())-1,camera_get_view_width(camera_get_active())+2,camera_get_view_height(camera_get_active())+2,color,0.5)  //intel graphics performing unnecessary alpha test
    gpu_set_blendmode(bm_add)
    rect(camera_get_view_x(camera_get_active())-1,camera_get_view_y(camera_get_active())-1,camera_get_view_width(camera_get_active())+2,camera_get_view_height(camera_get_active())+2,0,1)
    gpu_set_blendmode(0)
}

if (keepborder) {
    draw_sprite(spr_border,0,0,camera_get_view_y(camera_get_active()))
    //with (mmicon) if (image_index=5 || image_index=7 || image_index=9) event_perform(ev_draw,0) 
    //with (rosteroptions) event_perform(ev_draw,0)
    //if (goto=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
    draw_sprite_ext(spr_border,0,0,camera_get_view_y(camera_get_active()),1,1,0,$ffffff,v)
    //if (goto!=change) with (mmicon) if (image_index=1) event_perform(ev_draw,0)
}