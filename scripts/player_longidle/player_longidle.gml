if (sprite_index != spr_codalongidle) {
	sprite_index = spr_codalongidle;
}
else {
	if (animation_end()) {
		image_speed = 0;	
		image_index = 85;
	}

}


if (input_left || input_right || input_jump) {
	idletimer = idletimermax;
	mystate = PLAYERSTATE.free;
}
		
		
if (input_shoot) mystate = PLAYERSTATE.ranged;
if (input_melee) mystate = PLAYERSTATE.melee; 