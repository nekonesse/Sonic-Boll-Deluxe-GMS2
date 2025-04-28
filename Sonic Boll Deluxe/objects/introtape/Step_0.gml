if (visible) {
    image_xscale=max(1,image_xscale*0.777)
    if (!lock) {
        vspeed-=1
        if (y+vspeed<=ystart) {vspeed=0 y=ystart lock=1}
    }
}

if (lock) {
    f20=min(1,f20+0.02)
    if (f20=1) {
        if (!flare) {flare=1 instance_create_depth(x-80,y+44,0,cool_lens_flare)}
        fg20=min(1,fg20+0.05)
    }
}