#macro SEMI_UP 1
#macro SEMI_DOWN 2
#macro SEMI_LEFT 3
#macro SEMI_RIGHT 4

function player_collision(){
	grounded = false;
	
	if keyboard_check(vk_space) show_debug_message("")
	
	var coll = instance_place(x + hsp, y, collider)
	if (coll) && (!coll.semi || coll.semi == SEMI_LEFT || coll.semi == SEMI_RIGHT || (object_is_ancestor(coll.object_index, slopepar) && coll.semi)) {
		var yPlus = 0;
		var coll2 = instance_place(x + hsp, y - yPlus, collider)
		var touchingSemiSlope=false;
		if (coll2) && (coll2.semi) {
			with(coll2) {
				if (other.vsp<0 || other.bbox_bottom-1>bbox_bottom)
	            {
					touchingSemiSlope=true
	            } else if ((object_index==slopel_s && other.bbox_right>x)||(object_index==sloper_s && other.bbox_left<x)) && other.bbox_bottom-1>bbox_bottom
					touchingSemiSlope=true
			}
		}
		
		if !touchingSemiSlope
		while (coll2 && (!coll2.semi || coll2.semi == SEMI_UP) && yPlus <= min(abs(hsp), 12)) {
			yPlus += 1;
			coll2 = instance_place(x + hsp, y - yPlus, collider)
		}
		else yPlus=0;
		
		if (place_meeting(x + hsp, y - yPlus, coll) && !(object_is_ancestor(coll.object_index, slopepar) && coll.semi && !touchingSemiSlope)) {
			//if its just a regular solid, dont do any fancy checks
			if (!coll.semi) 
				|| (hsp < 0 && coll.semi == SEMI_RIGHT && coll.bbox_right-1<bbox_left) //right semi coll
				|| (hsp > 0 && coll.semi == SEMI_LEFT && coll.bbox_left>bbox_right-1) /*left semi coll*/ {
				while(!place_meeting(x + sign(hsp), y, coll)){
					x += sign(hsp);
				}
				hsp=0
			}
			
		} else {
			y -= yPlus;
		}
	} else {
		if (grounded) {
			var yMinus = 0;
			var coll=place_meeting(x + hsp, y + yMinus, collider)
			while((!coll || coll.semi == SEMI_LEFT || coll.semi == SEMI_LEFT) && yMinus <= min(abs(hsp), 12)){
				yMinus +=1;
				coll=place_meeting(x + hsp, y + yMinus, collider)
			}
			yMinus -= 1;

			//if there is a collision at yMinus (speed+1) but not at yMinus (speed) AND we're already on the ground, move down
			var coll=instance_place(x + hsp, round(y + yMinus) + 3, collider)
			if(coll && (!coll.semi || coll.semi==1) && !place_meeting(x + hsp, round(y + yMinus), collider) && grounded) {
				y = round(y + yMinus);
			}
		}
	}
	x+=hsp
	
	//Floor Collision
	if vsp >= 0 {
		var coll=instance_place(x,y+vsp,collider)
		var touchingSemiSlope=false;
		with(coll) {
			if (other.vsp<0 || other.bbox_bottom-1>bbox_bottom)
	        {
				touchingSemiSlope=true
	        } else if ((object_index==slopel_s && other.bbox_right>x)||(object_index==sloper_s && other.bbox_left<x)) && other.bbox_bottom-1>bbox_bottom
				touchingSemiSlope=true
		}
		if (coll) && (!coll.semi || (coll.semi==SEMI_UP && (coll.bbox_top>bbox_bottom-1 || object_is_ancestor(coll.object_index,slopepar)) && !touchingSemiSlope)) {
			while !(place_meeting(x, y+1, coll)) {
				y += 1;
			}
			vsp=0
		}
	} else {
	//Ceiling Collision
		var coll=instance_place(x,y+vsp,collider)
		if (coll) && (!coll.semi || (coll.semi==SEMI_DOWN && coll.bbox_bottom-1<bbox_top)) {
			while !(place_meeting(x, y-1, coll)) {
				y -= 1;
			}
			vsp=0
		}
	}
	y+=vsp
	
	var coll=instance_place(x,y+1,collider)
	if (vsp == 0) && (coll) && (!coll.semi || coll.semi == SEMI_UP) {
		grounded=true
	}
	
	//y=floor(y)
	var loopCount=0
	var coll=instance_place(x,y,collider)
	while (coll) && (!coll.semi) {
		y--
		coll=instance_place(x,y,collider)
		loopCount++;
		if loopCount>1000 break;
	}
}