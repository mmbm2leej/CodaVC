
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
		case PLAYERSTATE.floating: player_float(); break;
		case PLAYERSTATE.tookdmg: player_tookdmg(); break;
		case PLAYERSTATE.melee: playermeleeatk(); break;
		case PLAYERSTATE.meleecombo: playermeleecombo(); break;
		case PLAYERSTATE.ranged: player_godattack(); break;
		case PLAYERSTATE.longidle: player_longidle(); break;
		case PLAYERSTATE.death: player_gameover(); break;
		case PLAYERSTATE.jumprise: player_jumprise(); break;
		case PLAYERSTATE.fall: player_fall(); break;
		case PLAYERSTATE.speaking: player_speak(); break;
		case PLAYERSTATE.free: playerfree();
		//theres a cutscene state existing, but for now 
		//isnt in the switch 
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

if (hsp != 0) image_xscale = sign(hsp);
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

#region If in a cutscene

if (mystate == PLAYERSTATE.cutscene) {
	if (hsp != 0) hsp = approach(hsp,0,0.5);
	#region If the room is the cave entrance
	if (room == rm_caveentrance) {
			
			if (global.ch0endcutscene) {
				sprite_index = spr_codaidle;
				
				if (obj_cutscenemgr.createdoldman) {
					if (!ch0_codasurprised) {
					//act surprised
					vsp = -2;
					hsp = 2;
					instance_create_layer(id.x,id.y-150,"guilayer",obj_alertnotice);
					audio_play_sound(snd_alert4,-10,false);
					ch0_codasurprised = true;
					}
				} 
				
			} //mystate = PLAYERSTATE.free;
		
	}
	
	
	#endregion
	
	#region If room is post cadenza east
	if (room == rm_postCasCadEast0) {
			
		if (!(global.postCasPart1Watched)) {
				
			#region Run to the edge
			if (obj_cutscenemgr.playerRunToEdge) {
				if (id.x > 3984) {
					hsp = -3;
					sprite_index = spr_codarun;
					image_xscale = -1;
				} else {
					id.x = 3984;
					hsp = 0;
					//make the sprite of coda about to lose balance
					sprite_index = spr_codaidle; //FOR NOW
					with (obj_cutscenemgr) {
						playeratEdge = true;	
						playerRunToEdge = false;	
					}
				}
			} 
			#endregion
			
			#region Back off the edge
			if (obj_cutscenemgr.backOffEdge) {
				if (x < 4050) {
					hsp = 1.5;
					sprite_index = spr_codawalk;
					image_xscale = 1;
				} else {
					hsp = 0;
					sprite_index = spr_codaidle;
					with (obj_cutscenemgr) playerbackOffEdgeComplete = true;
				}
				
				if (obj_cutscenemgr.playerLookOutEdge) {
					image_xscale = -1;	
				}
	
			}
			#endregion

		} //mystate = PLAYERSTATE.free;
	
	
	}
	
	#endregion
	
	#region Walking scene
	if (room == rm_walkingscene) {
		sprite_index = spr_codawalk;	
		image_xscale = -1;
		image_speed = 1;
	}
	
	#endregion
	
}

#endregion