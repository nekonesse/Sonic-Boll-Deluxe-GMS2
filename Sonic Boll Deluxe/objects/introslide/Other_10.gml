image_index=choose(1,0)
image_speed=0

x=420
y=125+irandom(112)

with (introslide) if (id!=other.id && y=other.y && x>other.x-sprite_get_width(sprite_index)) other.y=max(125, (other.y+16) mod 164)
depth=999-floor(y/2)

image_blend=merge_color($ffff80,$808040,1-(y-104)/110)

hspeed=-(1+(y-104)/17.5)/2