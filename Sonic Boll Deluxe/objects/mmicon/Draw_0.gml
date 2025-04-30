if (image_index=0) {
    if (surface_exists(boll)) {
        gpu_set_fog(1,$a0a0a0,0,0)
        draw_surface_stretched(boll,x-22,y-21,40,40)
        draw_surface_stretched(boll,x-20,y-19,40,40)
        draw_surface_stretched(boll,x-22,y-19,40,40)
        draw_surface_stretched(boll,x-20,y-21,40,40)
        gpu_set_fog(1,$ffffff,0,0) //for some reason i dont understand, we can't use the outline shader here
        draw_surface_stretched(boll,x-22,y-20,40,40)
        draw_surface_stretched(boll,x-20,y-20,40,40)
        draw_surface_stretched(boll,x-21,y-21,40,40)
        draw_surface_stretched(boll,x-21,y-19,40,40)
		gpu_set_fog(0,0,0,0)
		shader_set_uniform_f(u_outline_color,0,0,0,1.0);
        draw_surface_stretched(boll,x-21,y-20,40,40)       
		shader_reset();
    }
}

draw_sprite(sprite_index,image_index+over*image_number/2,x,y)

over=0