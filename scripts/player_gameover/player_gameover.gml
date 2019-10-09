if (sprite_index != spr_codadeath) sprite_index = spr_codadeath;
else if (animation_end()) {
	image_speed = 0;
	image_index = 14;
	with (obj_gamemanager) gameover = true;	
}