/// @description Insert description here

#region Changing Sector

if (mouse_wheel_up()) {
	in_use = true;
	alarm[0] = 90;
	if (currentsector < 4) {
	
	currentsector++;	
	
	} else currentsector = 0;
	
}

if (mouse_wheel_down()) {
	in_use = true;
	alarm[0] = 90;
	if (currentsector > 0) {

		currentsector--;
	
	} else  currentsector = 4;
	
}

#endregion

#region The spin
to_angle = (persector * currentsector);

if (currentangle != to_angle) {
	var anglediff = (to_angle - currentangle);
	currentangle += (anglediff / spinspeed);
	
	
}

#endregion

#region fading in and out

if (in_use) {
	if (alpha < 1) alpha = approach(alpha,1,0.1);
	
} else {
	if (alpha > 0) alpha = approach(alpha,0,0.1);	
}



#endregion