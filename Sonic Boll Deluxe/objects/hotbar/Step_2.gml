if (!drawregion.flooding) {
    curp=cur
    if (!editcursor.ctrl) {savecur=cur cur=modulo(cur+editcursor.scrw,1,10)  /*if savecur!=cur {if !(settings("nolemonsound")) sound("systemselect") /*while lemonobjname(lemongrab.objlist[obj[cur],0])="0" {cur=modulo(cur+editcursor.scrw,1,10)}}*/}        
    for (i=1;i<10;i+=1) { 
        if (keyboard_check_pressed(ord("0")+i)) {   
            cur=i
            if !(settings("nolemonsound")) sound("systemselect")
        }
    }
    if (cur!=curp) {
       // str=lemonobjname(lemongrab.objlist[obj[cur],0])
        alpha2=3
        
        //str2=wordwrap(lemonobjdesc(lemongrab.objlist[obj[cur],0]),32)
        alpha3=10
    }
}
//while lemonobjname(lemongrab.objlist[obj[cur],0])="0" cur=modulo(cur+editcursor.scrw,1,10) //do NOT go into an infinite loop and crash the game if selecting 0

if (point_in_rectangle(mouse_x,mouse_y,x-180,y-20,x+180,y+40)) alpha=max(0.25,alpha-0.05)
else alpha=min(1,alpha+0.05)

alpha2=max(0,alpha2-0.05)
alpha3=max(0,alpha3-0.05)