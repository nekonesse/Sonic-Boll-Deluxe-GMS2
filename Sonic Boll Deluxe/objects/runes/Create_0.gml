depth=999999;
draw_texture_flush();
_cameraWIDTH		=400;
_cameraHEIGHT		=224;

_windowWidth=480;
_windowHeight=270;
_runesSurface=surface_create(_windowWidth,_windowHeight)

var i=0;
repeat (8) {
    _runesA[i]=random(1)+1
    _runesB[i]=random(1)+1
    _runesC[i]=random(360)
    _runesD[i]=12/(random(20)+5)
    _runesE[i]=7/(random(20)+5)
    _runesF[i]=make_color_hsv(irandom(255),255,32)
    _runesG[i]=(random(2)-1)*0.002
    _runesH[i]=(random(2)-1)*0.002
	i++;
}
_runesTime=0
_alpha=1
_runesFade=0

_runesTexture=sprite_get_texture(tex_runes,0)
_runesSurface=-1
_runesSurface2=-1
_runesWaitB=1
alarm[0]=2;