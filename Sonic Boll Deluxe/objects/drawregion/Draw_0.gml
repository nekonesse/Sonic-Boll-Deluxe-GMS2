if surface_exists(surf)
draw_surface_ext(surf,viewx,viewy,editzoom.level,editzoom.level,0,c_white,1)

draw_rectangle(viewx+16*editzoom.level, viewy+16*editzoom.level, viewx+((viewwidth-16)*editzoom.level), viewy+((viewheight-16)*editzoom.level),true)
if curs_in
rect(viewx+(16*editzoom.level)+gridx*(16*editzoom.level), viewy+(16*editzoom.level)+gridy*(16*editzoom.level), 16*editzoom.level, 16*editzoom.level,c_black,1,true)