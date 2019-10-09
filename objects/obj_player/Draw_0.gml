
#region Taking damage

var _invulnInterval =  8;
if ( (alarm[0] % _invulnInterval) <= _invulnInterval/2) {

	if (sprite_index >= 0) {
		gpu_set_fog(false,c_white,0,1);
		draw_sprite_ext(sprite_index,image_index,id.x,id.y,currentface,1,0,c_white,1);
	}
	
} else {

	if (sprite_index >= 0) {
		gpu_set_fog(true,c_white,0,1);
		draw_sprite_ext(sprite_index,image_index,id.x,id.y,currentface,1,0,c_white,1);
	}
	
}

gpu_set_fog(false,c_white,0,1);

#endregion

