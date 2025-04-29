if (go) {
    f=min(1,f+0.04)
    x=lerp(440,200,sqr(f))
    y=ystart+64-cos((1-x/200)*pi/2)*64
    
    if (f=1) {
    tail2+=0.2
    if tail2=2
    {
    tail+=1
    tail2=0
    }
    if (tail>4) {
    tail=0
    }
        time1+=0.2
        frame1=floor(time1)
        if (frame1>hand) {
            time1=0
            hand=irandom_range(20,60)
        }
        
        time2+=0.2
        frame2=floor(time2)
        if (frame2>blink) {
            time2=0
            blink=irandom_range(30,50)
            introslide1.blink+=10
        }
    }
}
