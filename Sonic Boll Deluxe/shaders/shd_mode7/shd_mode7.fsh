varying vec2 fragCoord;

//Variables:
//spriteUV: A 4-value vector that contains the UV coordinates of the top-left point of the texture and the size (in UV space) of the texture.
uniform vec4 spriteUV;
//mapSize: The size of the texture, in pixels. Used to properly scale the projected plane so it can be used with 2D collisions.
//IMPORTANT: If you use large textures, don't forget to change the texture size in the game options!
uniform float mapSize;
//height: A variable that simulates how high you're above the ground. Stretches/shrinks the perspective horizontally.
uniform float height;
//horizon: The y-position of the horizon. Anything above the horizon isn't rendered. 
uniform float horizon;
//offset: The positional offset of the map. Since we cannot move the object, we move the point of reference against the position.
uniform vec2 offset;
//angle: Similar to offset, this is the angle you're looking at.
uniform float angle;

void main()
{
	//Don't draw what isn't needed. If a pixel is above the horizon, it is discarded. Else it would draw what is behind you upside down.
	if(fragCoord.y < horizon) discard;
	
	//Re-centre the middle of the projection from bottom-centre to top-left. Invert y.
	//Currently this is strictly designed so that the screensize is strictly 256*256 pixels and origin of the projection is at (128, 256).
    vec2 fragCoordNew = vec2(fragCoord.x - 128.0, 256.0 - fragCoord.y);
	
	//Calculate perspective factor. Transform projected plane to 2D top-down plane.
    float perspective = height / ((256.0 - horizon) - fragCoordNew.y);
    vec2 perspectiveCoord = fragCoordNew * perspective;
    
	//Counter-rotate the 2D plane to align it with xy-axes. 
    float c = cos(radians(angle));
    float s = sin(radians(angle));
    vec2 rotatedCoord = vec2(perspectiveCoord.x * c - perspectiveCoord.y * s, perspectiveCoord.x * s + perspectiveCoord.y * c);
    
    vec2 offsetRotated = rotatedCoord + offset;

	//Rescale the coordinates based on the size of the image. 
    vec2 textureCoord = vec2(
        offsetRotated.x / mapSize,
        1.0 - offsetRotated.y / mapSize
    );
	//We discard what is outside of the rendered plane.
	if(any(lessThan(textureCoord, vec2(0.0, 0.0))) || any(greaterThan(textureCoord, vec2(1.0, 1.0)))) {
		discard;
	}

	gl_FragColor = texture2D(gm_BaseTexture, spriteUV.xy + spriteUV.zw * textureCoord);
}