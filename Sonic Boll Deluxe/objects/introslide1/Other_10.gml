//if sprite_index!=spr_garf
//{
	if ((frame1 mod 3)=2) draw_sprite(sprite_index,4,x,y)
	else if (frame1<2) draw_sprite(sprite_index,3,x,y)
	else draw_sprite(sprite_index,5,x,y)
//}