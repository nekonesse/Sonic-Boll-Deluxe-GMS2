global.halign=1
global.valign=1
draw_systext(x,y,string_replace_all(wordwrap(str,20),"#","##")) str=""
global.halign=0
global.valign=0

draw_sprite(spr_border,0,0,0)