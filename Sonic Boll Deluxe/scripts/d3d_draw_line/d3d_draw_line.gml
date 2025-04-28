// Feather disable all
/// @desc Function Description
/// @param {real} x1 The starting x coordinate of the line
/// @param {real} y1 The starting y coordinate of the line
/// @param {real} z1 The starting z coordinate of the line
/// @param {real} x2 The ending x coordinate of the line
/// @param {real} y2 The ending y coordinate of the line
/// @param {real} z2 The ending z coordinate of the line
/// @param {real} [radius] The radius of the line
/// @param {real} [c1] The vertex color to draw the beginning of the cylinder with (defaults to the current draw color)
/// @param {real} [a1] The vertex alpha to draw the beginning of the cylinder with (defaults to the current draw alpha)
/// @param {real} [c2] The vertex color to draw the end of the cylinder with (defaults to c1)
/// @param {real} [a2] The vertex alpha to draw the end of the cylinder with (defaults to a1)
function d3d_draw_line(x1, y1, z1, x2, y2, z2, radius = 4, c1 = draw_get_colour(), a1 = draw_get_alpha(), c2 = c1, a2 = a1) {
    var dx = x2 - x1
    var dy = y2 - y1;
    var dz = z2 - z1;
    var xup = frac(x1 * 976.78 + y1 * 238.18 + z1 * 228.97) * 2 - 1;
    var yup = frac(x1 * 248.22 + y1 * 246.58 + z1 * 652.52) * 2 - 1;
    var zup = frac(x1 * 137.66 + y1 * 959.17 + z1 * 683.85) * 2 - 1;
    
    var mat_lookat = matrix_build_lookat(x1, y1, z1, x2, y2, z2, xup, yup, zup);
    var mat_line = Drago3D_Internals.Mat4Inverse(mat_lookat);
    
    var l = point_distance_3d(0, 0, 0, dx, dy, dz);
    var cx1 = -radius;
    var cy1 = -radius;
    var cz1 = 0;
    var cx2 = radius;
    var cy2 = radius;
    var cz2 = l;
    var mat_current = matrix_get(matrix_world);
    matrix_set(matrix_world, mat_line);
    d3d_draw_capsule(cx1, cy1, cz1, cx2, cy2, cz2, -1, 1, 1, 12, c1, a1, c2, a1);
    matrix_set(matrix_world, mat_current);
}