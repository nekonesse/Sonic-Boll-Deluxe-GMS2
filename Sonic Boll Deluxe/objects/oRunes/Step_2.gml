if (_runesFade) {
    _alpha-=0.03;
    if (_alpha <= 0) {
        if (surface_exists(_runesSurface))
			surface_free(_runesSurface);
        instance_destroy();
        visible=0;
        exit
    }
}

_runesSurface=surface_create(_windowWidth,_windowHeight);
if (!surface_exists(_runesSurface)) exit

_runesTime+=1

draw_primitive_begin_texture(pr_trianglelist,_runesTexture)
var i=0;
repeat (8) {
    _x1=lengthdir_x(_runesA[i]+_runesG[i]*_runesTime,_runesC[i]);
    _y1=lengthdir_y(_runesB[i]+_runesH[i]*_runesTime,_runesC[i]);
    
    _x2=_x1+lengthdir_x(_runesD[i],_runesC[i]);
    _y2=_y1+lengthdir_y(_runesE[i],_runesC[i]);
    
    _x3=_x2+lengthdir_x(_runesD[i],_runesC[i]-90);
    _y3=_y2+lengthdir_y(_runesE[i],_runesC[i]-90);
    
    _x4=_x1+lengthdir_x(_runesD[i],_runesC[i]-90);
    _y4=_y1+lengthdir_y(_runesE[i],_runesC[i]-90);
    
    draw_vertex_texture_color(0,	0,		_x1,_y1,_runesF[i],1);
    draw_vertex_texture_color(_windowWidth,	0,		_x2,_y2,_runesF[i],1);
    draw_vertex_texture_color(0,	_windowHeight,	_x4,_y4,_runesF[i],1);
    draw_vertex_texture_color(0,	_windowHeight,	_x4,_y4,_runesF[i],1);
    draw_vertex_texture_color(_windowWidth,	0,		_x2,_y2,_runesF[i],1);
    draw_vertex_texture_color(_windowWidth,	_windowHeight,	_x3,_y3,_runesF[i],1);
	i++;
}

surface_set_target(_runesSurface);
draw_clear_alpha(0,1);
gpu_set_texrepeat(1);
gpu_set_blendmode(bm_add);
gpu_set_texfilter(1);
draw_primitive_end();                    
gpu_set_texfilter(0);
gpu_set_blendmode(0);
surface_reset_target();

_runesSurface2=surface_create(_windowWidth,_windowHeight);
if (!surface_exists(_runesSurface2))
	exit;

surface_set_target(_runesSurface2);
draw_surface_ext(_runesSurface,0,0,1,1,0,$101010,1);
surface_reset_target();
surface_set_target(_runesSurface);
draw_clear_alpha(0,1);
gpu_set_blendmode(bm_add);
repeat (16) draw_surface(_runesSurface2,0,0);
gpu_set_blendmode(0);
surface_reset_target();