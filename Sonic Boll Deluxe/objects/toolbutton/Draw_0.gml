draw_sprite_ext(spr_editorbuttonshadow,0,x,y,1,1,0,c_black,0.5)
draw_sprite(spr_editorbutton,(editcursor.tool=tool)*2,x,y)
draw_sprite_ext(spr_editortools,tool,x+8,y+8,1,1,0,c_black,0.5)
draw_sprite(spr_editortools,tool,x+7,y+7)

//if (over) drawtooltip((bbox_left+bbox_right)/2,97,toolname[tool],1)