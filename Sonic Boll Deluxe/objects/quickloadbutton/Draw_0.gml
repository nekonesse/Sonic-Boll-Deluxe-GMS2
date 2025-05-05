if (flash mod 60>30) over+=2
event_inherited()
if (flash mod 60>30) over-=2
draw_sprite_ext(spr_editoricons,1,x+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editoricons,1,x+7,y+7)
//if (over && quick) drawtooltip(bbox_left,97,"There is a quicksave file available",0)
//else if (over) drawtooltip(bbox_left,97,"Open",0)