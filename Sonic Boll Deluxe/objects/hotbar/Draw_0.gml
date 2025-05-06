t+=1
for (var i=0;i<9;i+=1) {
    var xx=x-159+40*i
    var so = t + (i*6);
    
    if (cur == i+1) {
        yraise[i]=approach_val(yraise[i],-8,1)
        why = 0;
    } else { 
        yraise[i]=approach_val(yraise[i],0,1)
        why = sin(so*pi*freq/room_speed)*amp;
    }
    
    //if !settings("funmode")
    //yy=(y+why)+yraise[i]
    //else
    var yy=y+yraise[i]
    
    //if (editcursor.tool=2 && cur=i+1) draw_sprite_ext(spr_editorbutton,1+!editcanflood(lemongrab.objlist[obj[cur],0]),xx,yy,1,1,0,$ffffff,alpha)
   /* else*/ 
	draw_sprite_ext(spr_editorbuttonshadow,0,xx,yy,1,1,0,c_black,0.5)
	draw_sprite_ext(spr_editorbutton,(cur=i+1),xx,yy,1,1,0,$ffffff,alpha)
	
    
	if (cur=i+1) draw_sprite_ext(spr_editsel,0,xx,yy,1,1,0,$ffffff,alpha)
    
    if (obj[i+1]!=-1) draw_sprite_ext(spr_editpal,lemongrab.objdat[$ obj[i+1]][2],xx,yy,1,1,0,c_black,0.5) draw_sprite_ext(spr_editpal,lemongrab.objdat[$ obj[i+1]][2],xx-1,yy-1,1,1,0,$ffffff,alpha)
}

global.tscale=2
global.halign=1
global.valign=2   
//draw_systext(x+16,y-18,wordwrap(str,45),$ffffff,alpha2)
global.valign=0
//draw_systext(x+16,97,wordwrap(str2,45),$ffffff,alpha3)
global.tscale=1
global.halign=0