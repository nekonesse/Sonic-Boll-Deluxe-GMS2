if (editmanager.tab==n) {
    yraise=approach_val(yraise,-8,1)
} else { 
    yraise=approach_val(yraise,0,1)
}
    
yy=y+yraise

draw_sprite_ext(spr_editortabshadow,0,x,yy,1,1,0,c_black,0.5)
draw_sprite(spr_editortab,!!over || (editmanager.tab==n),x,yy)
draw_sprite_ext(spr_editortabs,n,x+13,yy+13,1,1,0,c_black,0.5)
draw_sprite(spr_editortabs,n,x+12,yy+12)
draw_systext(x+26,yy+8,editmanager.tabnames[n])
draw_omitext(x+sprite_width-12,yy+9,editmanager.tabshortcut[n])