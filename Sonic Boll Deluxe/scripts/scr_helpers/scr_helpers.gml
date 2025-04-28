function chance(percent){
	// Returns true or false depending on RNG
	//Chance(0.7);    -> Returns true 70% of the time
	return percent > irandom(1);
}

function jump_in_direction(_spd, _direction){
	x += lengthdir_x(_spd,_direction)
	y += lengthdir_y(_spd,_direction)
}

function approach_val(a, b, amount) {
	// Moves "a" towards "b" by "amount" and returns the result
	// Nice bcause it will not overshoot "b", and works in both directions
	// Example:
	//      x = Approach(x, target_x, move_speed);
	//      y = Approach(y, target_y, move_speed);
 
	if (a < b)
	{
	    a += amount;
	    if (a > b)
	        return b;
	}
	else
	{
	    a -= amount;
	    if (a < b)
	        return b;
	}
	return a;
}

function wrap_val(value, _min, _max) {
	// Returns the value wrapped, values over or under will be wrapped around
 
	if (value mod 1 == 0)
	{
	    while (value > _max || value < _min)
	    {
	        if (value > _max)
	            value += _min - _max - 1;
	        else if (value < _min)
	            value += _max - _min + 1;
	    }
	    return(value);
	}
	else
	{
	    var vOld = value + 1;
	    while (value != vOld)
	    {
	        vOld = value;
	        if (value < _min)
	            value = _max - (_min - value);
	        else if (value > _max)
	            value = _min + (value - _max);
	    }
	    return(value);
	}
}

function wave_val(from, to, duration, offset=0) {
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Example
	//      image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
 
	var a4 = (to - from) * 0.5;
	return from + a4 + sin((((global.roomTimer * 0.015) + duration * offset) / duration) * (pi*2)) * a4;
}

function ternary(statement,true_val,false_val) {
	return ((statement) ? true_val : false_val)
}

function draw_rect(_x, _y, w, h, color, alpha, outline=false){
	if !outline
	draw_sprite_stretched_ext(tex_1x1,0,_x,_y,w,h,color,alpha)
	else
	draw_sprite_stretched_ext(tex_1x1outline,0,_x,_y,w,h,color,alpha)
}

function lines_intersect(x1,y1,x2,y2,x3,y3,x4,y4,segment) {
    var ua, ub, ud, ux, uy, vx, vy, wx, wy;
    ua = 0;
    ux = x2 - x1;
    uy = y2 - y1;
    vx = x4 - x3;
    vy = y4 - y3;
    wx = x1 - x3;
    wy = y1 - y3;
    ud = vy * ux - vx * uy;
    if (ud != 0) 
    {
        ua = (vx * wy - vy * wx) / ud;
        if (segment) 
        {
            ub = (ux * wy - uy * wx) / ud;
            if (ua < 0 || ua > 1 || ub < 0 || ub > 1) ua = 0;
        }
    }
    return ua;
}