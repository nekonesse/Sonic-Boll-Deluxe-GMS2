//if sprite_index!=spr_tails
//{
if (frame1=9 || frame1=11 || frame1=13 || frame1=15) draw_sprite(sprite_index,4,x,y)
else if (frame1=10 || frame1=14) draw_sprite(sprite_index,5,x,y)
else draw_sprite(sprite_index,3,x,y)
//}