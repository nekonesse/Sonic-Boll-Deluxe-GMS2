event_inherited()
draw_sprite_ext(spr_editoricons,sub,x+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editoricons,sub - ((sub == 24)*22),x+7,y+7)
//if (sub=2 && !drawregion.unchanged) draw_sprite(spr_editoricons,17,x+15,y-1)

/*if (over) {
    if (sub=0) drawtooltip(bbox_left,97,"New File",0)
    //quickload is 1
    if (sub=2) drawtooltip(bbox_left,97,"Save",0)
    if (sub=5) drawtooltip(bbox_right,97,"Quit",2)
    if (sub=6) drawtooltip(bbox_left,97,"Play (F5)",0)
    if (sub=7) drawtooltip((bbox_left+bbox_right)/2,97,"Time:#"+string(lemongrab.time),1)
    if (sub=8) drawtooltip((bbox_left+bbox_right)/2,97,"Name:#"+lemongrab.levelname,1)
    if (sub=9) drawtooltip((bbox_left+bbox_right)/2,97,"Description:#"+lemongrab.leveldesc,1)
    if (sub=11) drawtooltip(bbox_right,97,"Window Size",2)
    if (sub=12) drawtooltip(bbox_right,97,"Skin:#"+skinstr("name"),2)
    if (sub=13) drawtooltip(bbox_right,97,"Fullscreen",2)
    //quicksave is 14
    if (sub=15) drawtooltip(bbox_left,97,"Undo",0)
    //undo is 16
    if (sub=18) drawtooltip(bbox_right,97,"Windowed",2)
    
    if (sub=22) drawtooltip((bbox_left+bbox_right)/2,97,"Beep Block# Behavior",2)
    if (sub=23) drawtooltip((bbox_left+bbox_right)/2,97,"Region Darkness:#"+string(lemongrab.lightlevel[drawregion.region]),2)
    if (sub=24) drawtooltip(bbox_left,97,"Simulate Save Error",0)
    if (sub=25) drawtooltip(bbox_left,97,"Level Skin:#"+string(global.lemonlskin),0)
}*/