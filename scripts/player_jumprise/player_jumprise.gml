#region Movement while jumping?

var movedir = input_right - input_left;
hsp = movedir * movespd;

#endregion

#region Attacking while rising

//this doesnt work yet
if (input_melee) {

	player_risemelee();
	
}




#endregion

/*
if (place_meeting(x+hsp,y,obj_wallboundary)) {
	while (!place_meeting(x+sign(hsp),y,obj_wallboundary)) {
		x += sign(hsp);	
	}
	hsp = 0;		//this is causing sprite to collide with the floor
}

x += hsp;

*/

#region Jump

if (!jumping) {
	vsp = jumpspd;
	jumping = true;
}

if (!place_meeting(x,y+1,obj_boundary)) {
	
	if (vsp <= 0) {
		sprite_index = spr_codajump;
		if (animation_end()) image_index = 5;
	
	}

}


if (vsp > 0) mystate = PLAYERSTATE.fall;


#endregion
