if (instance_exists(segafade)) if (segafade.object_index=segafade) exit

//if (instance_exists(keyconfig)) {visible=0 exit}
//else visible=1

if (special) input_get(0)
else input_get(p2)
wdown=0
wup=0
if (special && canmouse) mousecursor(0)

x=median(global.view_xview+8,x+(right-left)*2,global.view_xview+392)
y=median(global.view_yview+8,y+(down-up)*2,global.view_yview+216)

//if (instance_exists(statshow)) {
//    if (abut || bbut || (cbut && !statshow.maxpage)) statshow.go=1
//    if (cbut && statshow.alpha == 1) statshow.curpage+=1
//    exit
//}

/*pf1=instance_position(x,y,stagemode)
pf2=instance_position(x,y,stagenum)
pf3=instance_position(x,y,stagepick)
pf4=instance_position(x,y,stagego)
pf5=instance_position(x,y,genericbutton) 
*/
pf6=instance_position(x,y,mmicon)   
/*pf8=instance_position(x,y,worldskinlist)
pf9=instance_position(x,y,optvol)
pf10=instance_position(x,y,optmusvol)
pf11=instance_position(x,y,bundlelist)
pf12=instance_position(x,y,optcamshim)
pf13=instance_position(x,y,ta_worldskinlist)

with (pf1) {if (other.y<y+16 || other.y>=y+20) over=other.id}
with (pf2) image_index=1+(other.x>x+44)
with (pf3) event_user(1)
with (pf4) over=1 
with (pf5) {over=other.id neweroptions.str=lang("tip "+object_get_name(object_index))}
*/
with (pf6) event_user(1)     
/*with (pf8) if (other.x>=x) {over1=(other.y<y+19) over2=(other.y>y+116)}
with (pf9) {over=other.id neweroptions.str=lang("tip "+object_get_name(object_index))}
with (pf10) {over=other.id neweroptions.str=lang("tip "+object_get_name(object_index))}
with (pf11){over1=(other.y<y+19) over2=(other.y>y+116)}
with (pf12){over=other.id neweroptions.str=lang("tip "+object_get_name(object_index))}
with (pf13) {over1=(other.x<x+20) over2=(other.x>bbox_right-20)}*/

if (wdown || wup) {
    with (pf3) event_user(2)
    with (pf8) event_user(2)
    with (pf11) event_user(2)
}
           
if (sbut) {
    //with (stagectrl) event_user(0)
}

if (abut) {
    with (pf1) event_user(0)
    with (pf2) event_user(0)
    with (pf3) event_user(0)
    with (pf4) event_user(0) 
    with (pf5) event_user(0)
    with (pf6) event_user(0) 
    with (pf8) event_user(0)
    with (pf11) event_user(0)
    with (pf13) event_user(0)

    // (languagepicker) event_user(0)
}                    

if (bbut) {
    with (pf2) event_user(1)
    with (pf5) event_user(1)
    with (pf8) event_user(1)
    //with (replayctrl) selgo=0
}

if (sbut) {
    //if (room=mainmenu && !instance_exists(segafadein)) segafadeto(roster,"systemstart")
    //if (room=ta_menu && instance_exists(tactrl)) {
    //    tactrl.go=1
    //    segafadeto(change,"systemstart")
    //}
}
if (cbut) {
   // if (room=ta_menu && instance_exists(ta_view)) {
    //    ta_view.showcharrecord = !ta_view.showcharrecord
    //    sound("systemselect")
    //}
}

if (akey) {
    //with (pf9) event_user(0)
   /// with (pf10) event_user(0)
    //with (pf12) event_user(0)
    if (abut) image_index=1
    image_index=min(2,image_index+0.2)
} else if (bkey) {
    //with (pf9) event_user(1)
    //with (pf10) event_user(1)
    //with (pf12) event_user(1)
	if (bbut) {
		image_index=3
	}
    image_index=min(4,image_index+0.2)
} else image_index=0
