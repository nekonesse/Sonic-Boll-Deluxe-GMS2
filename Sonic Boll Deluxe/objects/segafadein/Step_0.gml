v+=(0.06+(v<0.5)*0.06)*0.6
if (v>1) instance_destroy()
color=merge_color(merge_color(0,$80ffff,min(1,(1-v)*2)),$ffffff,max(0,((1-v)-0.5)*2))   