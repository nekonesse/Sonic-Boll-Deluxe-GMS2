/*if !settings("funmode") {
    mouse_hsp=x-xprevious;
    mouse_vsp=y-yprevious;
    
    image_angle = round(mouse_vsp)*2+round(mouse_hsp)*2 //funny dance
} else {
    mouse_hsp=0;
    mouse_vsp=0;
    image_angle=0;   
}*/

draw_self();                                                              

/*if (drawregion.flooding) draw_sprite(spr_editortools,6,x+18,y)
else if (drawregion.grab || (middle && !drawregion.drawing && !drawregion.grabf && !drawregion.grabs && !drawregion.grabj && !drawregion.resize && !drawregion.selecting)) draw_sprite(spr_editortools,8,x+18,y)
else */
if (drawregion.hide_curs) {
    if (tool=0 && ctrl) draw_sprite(spr_editortools,5,x+18,y)
    else if (tool=0) {
        if (shift) draw_sprite(spr_editortools,8,x+18,y)
        //else if (lemongrab.objlist[hotbar.obj[hotbar.cur],0]=waterblock) draw_sprite(lemongrab.objlist[hotbar.obj[hotbar.cur],1],0,x+18,y)
        else draw_sprite(spr_editortools,0,x+18,y)
    }
    else draw_sprite(spr_editortools,tool,x+18,y)
}