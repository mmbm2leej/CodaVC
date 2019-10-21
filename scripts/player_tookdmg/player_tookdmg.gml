if (sprite_index != spr_codahurt) sprite_index = spr_codahurt;
with (obj_camera) {
	shakemagnitude = 10;	
}

if (	(sprite_index == spr_codahurt)		&&		(animation_end())	) mystate = PLAYERSTATE.free;	

