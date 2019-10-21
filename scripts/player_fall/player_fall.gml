#region Movement while jumping?

var movedir = input_right - input_left;
hsp = movedir * movespd * 0.6;




#endregion

if (mask_index == noone) {
	mask_index = spr_codafall;	
}



if (place_meeting(x+hsp,y,obj_wallboundary)) {
	while (!place_meeting(x+sign(hsp),y,obj_wallboundary)) {
		x += sign(hsp);	
	}
	hsp = 0;		//this is causing sprite to collide with the floor
}


if (vsp >= 0) {
	vsp += 0.1;
	if (!place_meeting(x,y+1, obj_boundary)) {
		sprite_index = spr_codafall;
		if (!animation_end()) image_speed = 1;
		else {
			image_speed = 0;
			image_index = 3;
		}
	
	} else {
		if (!audio_is_playing(snd_tap0)) audio_play_sound(snd_tap0,0,false); 
		mystate = PLAYERSTATE.free;	
	}

	if (sprite_index == spr_codafall) image_index = animation_end(sprite_index,3);
	
}
