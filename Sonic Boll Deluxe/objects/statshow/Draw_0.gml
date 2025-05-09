rect(0,0,400,224,0,alpha*0.5)

draw_sprite_ext(spr_replayboxbig,!!maxpage,x,y,1,1,0,$ffffff,alpha)
if (curpage>maxpage)
    curpage=0

if (maxpage) {
    global.halign=1
    draw_systext(x+275,y+122,lang("stats page"),$ffffff,alpha)
    draw_systext(x+275,y+130,string(curpage)+"/"+string(maxpage),$ffffff,alpha)
    draw_systext(x+275,y+142,replacebuttonnames("([c])"),$ffffff,alpha)
    global.halign=0
}


draw_omitext(x+3,y+3,str[curpage],$ffffff,alpha)
draw_omitext(x + ((sprite_width - 78) / 2),y+3,str2[curpage],$ffffff,alpha)