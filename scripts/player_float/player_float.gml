
if (!place_meeting(x,y-1,obj_boundary)) vsp = -6;
else vsp = 0;
floatDuration = approach(floatDuration, 0, 1);


#region Moving Horizontally


var movedir = input_right - input_left;
hsp = movedir * movespd;

if (hsp != 0) { 
	currentface = -1 * sign(hsp);
	image_xscale = currentface;
}


#region Horizontal Collision

if (place_meeting(x+hsp,y,obj_wallboundary)) {
	while (!place_meeting(x+sign(hsp),y,obj_wallboundary)) {
		x += sign(hsp);	
	}
	hsp = 0;		//this is causing sprite to collide with the floor
}

#endregion

sprite_index = spr_codafloat;

#endregion

#region Stop on command
if (input_jump) {
	floatDuration = 0;	
}

#endregion

if (floatDuration == 0)  {
	mystate = PLAYERSTATE.free;	
}