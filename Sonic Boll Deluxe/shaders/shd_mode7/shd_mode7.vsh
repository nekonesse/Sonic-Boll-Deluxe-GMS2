//This is the stock vertex shader. Irrelevant for this.

attribute vec3 in_Position; 

varying vec2 fragCoord;

uniform vec2 position;

void main() 
 {
   vec4 Position = vec4(in_Position, 1.0); 
   gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * Position; 
   //Normalize position inside of object "window"
   fragCoord = in_Position.xy-position.xy; 
 }