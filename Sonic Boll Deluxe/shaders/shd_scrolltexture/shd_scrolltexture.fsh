//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_scroll_x;

uniform vec2 u_resolution;

void main()
{
	
	//Pixel coordinates centered in the middle of the screen
	vec2 pos = vec2(gl_FragCoord.x - u_scroll_x, gl_FragCoord.y) - u_resolution*0.5;

	//Perspective ratio (0.0 = no perspective)
	float ratio = -1.0;

	//Compute uv coordinates with perspective ratio
	vec2 uv = pos / (u_resolution.y - pos.y * ratio) + 0.5;
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, uv);
}

