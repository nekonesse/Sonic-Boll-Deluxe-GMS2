if (go) {
    f=min(1,f+0.04)
    x=lerp(-40,200,sqr(f))
    y=ystart+64-cos((1-x/200)*pi/2)*64
    if (f=1) {
        time1+=0.2
        frame1=floor(time1 mod 6)
        
        time2+=0.2
        frame2=floor(time2)
        if (frame2>blink) {
            time2=0
            blink=irandom_range(8,40)
            introslide2.blink+=10
        }
    }
}