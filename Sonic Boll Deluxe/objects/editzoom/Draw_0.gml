draw_sprite_ext(spr_editorzoomshadow,0,x,y,1,1,0,c_black,0.5)
draw_sprite(spr_editorzoom,!!over,x,y)
draw_sprite(spr_editorbutton,2,x+xd,y)
draw_sprite_ext(spr_editoricons,4,x+xd+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editoricons,4,x+xd+7,y+7)

//if (over) drawtooltip((bbox_left+bbox_right)/2,97,"Zoom: "+string(round(levelgo*100))+"%",1)