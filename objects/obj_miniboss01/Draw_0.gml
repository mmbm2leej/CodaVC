draw_self();

if (active) {
	draw_sprite_ext(sprite_index,0,id.x,id.y,1,1,0,c_red,wave(0,0.6,4,0));	
}


#region Taking damage

if (invincible) {
	var _invulnInterval =  8;
	if ( (alarm[2] % _invulnInterval) <= _invulnInterval/2) {

		if (sprite_index >= 0) {
			gpu_set_fog(false,c_white,0,1);
			draw_sprite_ext(sprite_index,image_index,id.x,id.y,image_xscale,1,0,c_white,alpha);
		}
	
	} else {

		if (sprite_index >= 0) {
			gpu_set_fog(true,c_white,0,1);
			draw_sprite_ext(sprite_index,image_index,id.x,id.y,image_xscale,1,0,c_white,alpha);
		}
	
	}
	gpu_set_fog(false,c_white,0,1);
}



#endregion

