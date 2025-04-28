// Feather disable all
/// @desc Draw a 3D cone. Skips some of the optional parameters to speed up caching.
/// @param {real} x1 The starting x coordinate of the cone
/// @param {real} y1 The starting y coordinate of the cone
/// @param {real} z1 The starting z coordinate of the cone
/// @param {real} x2 The ending x coordinate of the cone
/// @param {real} y2 The ending y coordinate of the cone
/// @param {real} z2 The ending z coordinate of the cone
/// @param {pointer.Texture|real} tex The texture to draw the cone with (defaults to -1 for no texture)
/// @param {bool} closed Whether to draw the bottom surface or not (defaults to true)
function d3d_draw_cone_simple(x1, y1, z1, x2, y2, z2, tex = -1, closed = true) {
    static vertex = Drago3D_Internals.Vertex;
    static format = Drago3D_Internals.format;
    
    static vb = undefined;
    static vb_bottom = undefined;
    
    static r = 0.5;
    static nr = -r;
    static steps = 32;
    
    if (vb == undefined) {
        vb = vertex_create_buffer();
        vertex_begin(vb, format);
        
        // Create sin and cos tables
        var cc = array_create(steps + 1);
        var ss = array_create(steps + 1);
        var hsteps = 1 / steps;
        
        for(var i = 0; i <= steps; i++) {
        	var rad = (i * 2.0 * pi) / steps;
        	cc[i] = cos(rad);
        	ss[i] = sin(rad);
        }
        
        var rows = floor((steps + 1) / 2);
        var vrows = 1 / rows;
        
        for(var i = 0; i <= steps; i++) {
            var cci = cc[i];
            var ssi = ss[i];
        	vertex(vb, 0, 0, r, 0, 0, 1, hsteps * i, 1, c_white, 1);
        	vertex(vb, cci * r, ssi * r, nr, cci , ssi, 0, hsteps * i, 0, c_white, 1);
        }
        
        vertex_end(vb);
        vertex_freeze(vb);
        
        vb_bottom = vertex_create_buffer();
        vertex_begin(vb_bottom, format);
        
        for(var i = steps; i > 0; i--) {
            var cci = cc[i] / 2;
            var ssi = ss[i] / 2;
            var cci2 = cc[i - 1] / 2;
            var ssi2 = ss[i - 1] / 2;
            vertex(vb_bottom, 0, 0, 0, 0, 0, 1, 0.5, 0.5, c_white, 1);
            vertex(vb_bottom, cci, ssi, 0, 0, 0, -1, 0.5 + cci, 0.5 + ssi, c_white, 1);
            vertex(vb_bottom, cci2, ssi2, 0, 0, 0, -1, 0.5 + cci2, 0.5 + ssi2, c_white, 1);
        }
        
        vertex_end(vb_bottom);
        vertex_freeze(vb_bottom);
    }
    
    var sx = x2 - x1;
    var sy = y2 - y1;
    var sz = z2 - z1;
    var cx = mean(x1, x2);
    var cy = mean(y1, y2);
    var cz = mean(z1, z2);
    var transform = matrix_build(cx, cy, cz, 0, 0, 0, sx, sy, sz);
    var current = matrix_get(matrix_world);
    matrix_set(matrix_world, matrix_multiply(transform, current));
    vertex_submit(vb, pr_trianglestrip, tex);
    
    if (closed) {
        transform = matrix_build(cx, cy, z1, 0, 0, 0, sx, sy, 1);
        matrix_set(matrix_world, matrix_multiply(transform, current));
        vertex_submit(vb_bottom, pr_trianglelist, tex);
    }
    
    matrix_set(matrix_world, current);
}