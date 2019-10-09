
#region Inputs

input_left = (keyboard_check(ord("A")));
input_right = (keyboard_check(ord("D")));
input_jump = (keyboard_check_pressed(vk_space));
toggle_runwalk = (keyboard_check_pressed(vk_shift));
input_shoot = (mouse_check_button_pressed(mb_left));
input_melee = (mouse_check_button_pressed(mb_right) || (keyboard_check_pressed(ord("K"))));
input_interact = (keyboard_check_pressed(ord("E")));

#endregion

#region Horizontal Friction

if	(		((!input_left) && (hsp < 0))		 ||			((!input_right) && (hsp > 0))		) {
	hsp = approach(hsp,0,horizontalfriction);
}

#endregion

#region State system

	switch mystate {
		
		case PLAYERSTATE.tookdmg: player_tookdmg(); break;
		case PLAYERSTATE.melee: playermeleeatk(); break;
		case PLAYERSTATE.meleecombo: playermeleecombo(); break;
		case PLAYERSTATE.ranged: playerrangedatk(); break;
		case PLAYERSTATE.longidle: player_longidle(); break;
		case PLAYERSTATE.death: player_gameover(); break;
		case PLAYERSTATE.jumprise: player_jumprise(); break;
		case PLAYERSTATE.fall: player_fall(); break;
		case PLAYERSTATE.speaking: player_speak(); break;
		case PLAYERSTATE.free: playerfree();
	}


#endregion

#region Invincibility frames

if (invincible) {
	redflashalpha = approach(redflashalpha,1,0.3);
	if (alarm[0] < 0) alarm[0] = 30;
} else {
	redflashalpha = approach(redflashalpha,0,0.01);
}




#endregion

#region Gravity and Vertical Collision(below)

if (vsp <= 0) vsp += grav; else vsp += 2*grav;

if (place_meeting(x,y+vsp,obj_boundary)) {
	while (!place_meeting(x,y+sign(vsp),obj_boundary)) {
		y += sign(vsp);	
	}
	vsp = 0;		//this is causing sprite to collide with the floor
}


/*
if (!place_meeting(id.x,id.y+1,obj_boundary)) {
	if (vsp < 0) {
		vsp += grav;
	} else {
		vsp += 2*grav;
	}
} else {
	vsp = 0;
}
*/


#region Unsticking player object
/*
if (place_meeting(x,y,obj_boundary)) {
	if (!place_meeting(x,id.bbox_top-1,obj_boundary)) {
		y--;	
	}
	
}
*/

#endregion

#endregion

x += hsp * movespd;
y += vsp;

#region Unsticking

if (place_meeting(x,y,obj_boundary)) {
	for (var i = 0; i < 200; ++i) {
		//Check up
		if (!place_meeting(x,y-i,obj_boundary)) {
			y-=i;
			break;
		}

		
		//Check left
		if (!place_meeting(x - i,y,obj_boundary)) {
			x-=i;
			break;
		}
		
		//Check right
		if (!place_meeting(x + i,y,obj_boundary)) {
			x+=i;
			break;
		}
		
		//Check down
		if (!place_meeting(x,y + i,obj_boundary)) {
			y+=i;
			break;
		}
		
	}
}

#endregion

#region Taking damage

if (global.playercurrenthp < 0) global.playercurrenthp = 0;

#endregion

#region Transitioning rooms

if (place_meeting(x,y, obj_transitionboundary)) {
	var partner = (instance_place(x,y,obj_transitionboundary));
	
	with (obj_loadscreen) {
		myState = true;	
			
	}
	
	if (obj_loadscreen.myAlpha == 1) {
		with (obj_roomsequence) {
			if (!doTransition) {
				targetRoom = partner.mytargetroom;
				targetx = partner.mytargetx;
				targety = partner.mytargety;
				doTransition = true;
			}
		}
	}
	
}

if (place_meeting(x,y, obj_entranceboundary)) {
	if (input_interact) {
		var partner = (instance_place(x,y,obj_entranceboundary));
		
		with (obj_loadscreen) {
			myState = true;		
		}
		if (obj_loadscreen.completed) {
		
			with (obj_roomsequence) {
				if (!doTransition) {
					targetRoom = partner.mytargetroom;
					targetx = partner.mytargetx;
					targety = partner.mytargety;
					doTransition = true;
				}
			}
			
		}
		
		with (obj_loadscreen) receivedcompletion = true;
		
		
	}
	
}



#endregion

#region Death Sequence

if (global.playercurrenthp <= 0) {
	mystate = PLAYERSTATE.death;
	player_gameover();	
}

#endregion

#region Interacting with Power Nodes

//Might need to put this in player free once this section is complete

if (input_interact) {
	if (place_meeting(x,y,obj_powernode)) {
		var myNode = instance_place(x,y,obj_powernode);
		player_acquirenode(myNode);

	}
}



#endregion