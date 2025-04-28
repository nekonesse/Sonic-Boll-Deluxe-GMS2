//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 in_Texel;
uniform vec4 outlineColor;

void main()
{
	vec4 dispColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (texture2D( gm_BaseTexture, v_vTexcoord ).a <= 0.0)
	{
		// transparent pixel, check for surrounding pixels
		
		float alpha = texture2D( gm_BaseTexture,
								 vec2(v_vTexcoord.x,
								 v_vTexcoord.y + in_Texel.y) ).a;
								
								
		alpha += texture2D( gm_BaseTexture,
							vec2(v_vTexcoord.x,
							v_vTexcoord.y - in_Texel.y) ).a;
							
		alpha += texture2D( gm_BaseTexture,
							vec2(v_vTexcoord.x + in_Texel.x,
							v_vTexcoord.y) ).a;
							
		alpha += texture2D( gm_BaseTexture,
							vec2(v_vTexcoord.x - in_Texel.x,
							v_vTexcoord.y) ).a;
								
		if (alpha > 0.0)
		{
			dispColor = outlineColor;
		}
	}
	
    gl_FragColor = dispColor;
}
