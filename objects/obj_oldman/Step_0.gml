#region Cutscene Sequencing

	#region chapter 0 end
	if (room == rm_caveentrance) {
		#region being surprised
	
		if (obj_player.ch0_codasurprised) {
			oldmansurprisedtimer--;
		
			if (oldmansurprisedtimer <= 0) {
				if (!oldmansurprised) {
					vsp = -2;
					hsp = -2;
					instance_create_layer(id.x,id.y-150,"guilayer",obj_alertnotice);
					audio_play_sound(snd_alert2,-10,false);	
					alarm[0] = 120;
					oldmansurprised = true;
				}
			}

		}
		#endregion
	
		#region Running sequence
			//run to coda, grab coda, hide behind stalagmite
			if (oldmanstartrun) {
				if (place_meeting(x,y,obj_player)) {
				
					var player = instance_place(x,y,obj_player);	
					var myX = id.x; var myY = id.y;
					with (player) {
						x = myX;
						y = myY;
					}
				
				}
			
				if (id.x < 385) {
					hsp = 6;
					sprite_index = spr_oldman_run;
		
				} else {
		
					hsp = 0;
					sprite_index = spr_oldman_idle;	
				}
		
				if (id.x >= 385) {
					alarm[3] = 120;
					oldmanstartrun = false;
				}
		
			}
			#endregion

		#region Hidden
		
		if (hidden) {
			#region clear all cutscene boxes
			if (instance_exists(obj_cutscenehitbox)) instance_destroy(obj_cutscenehitbox);
			
			#endregion
			if (obj_musicmanager.cascadeOver) {
				alarm[4] = 120;
				hidden = false;
			}
			
		}
		
		
		#endregion
		
		#region Speaking
		if (placeforDialogue) {
			if (id.x > 200) {
				hsp = -6;	
				image_xscale = sign(hsp);
				sprite_index = spr_oldman_run;
			} else {
				hsp = 0;
				image_xscale = 1;
				sprite_index = spr_oldman_idle;	
			}
		
			if (id.x <= 200) {
				placeforDialogue = false;
			}	
		}

		#endregion
		
		#region Leave
		
			if (spokench0cave) {
				with (inst_15EB46A2) {
					mytargetroom = rm_postCasCadEast0;
					mytargetx = 4170;
					mytargety = 1140;
				
				}
				if (id.x > 95) {
					hsp = -2;	
					image_xscale = sign(hsp);
					sprite_index = spr_oldman_walk;
				} else {
					hsp = 0;
					sprite_index = spr_oldman_idle;	
				}
		
				if (id.x <= 95) {
					
					var lastCutscene = instance_create_layer(300,1020,"boundarylayer",obj_cutscenehitbox);
					with (lastCutscene) {
						mydialoguespeakers = ["Coda"];
						mydialoguetext = ["..."];
						myPortSeq = [1];
						myflag = 0;
						sprleft = spr_dialoguespriteph;
						sprright = spr_codadialogue;
						image_xscale = 4;
						image_yscale = 12;
						active = true;
					}
					
					instance_destroy();
				}	
			
			}
	}
		
		#endregion
		
	#endregion
	
	#region chapter 0 end
	if (room == rm_postCasCadEast0) {
		if (obj_cutscenemgr.playeratEdge) {
			if (x > 3990) {
				hsp = -1.5;
				sprite_index = spr_oldman_walk;
				image_xscale = -1;
			} else {
				x = 3990;
				hsp = 0;
				sprite_index = spr_oldman_idle;
				with (obj_cutscenemgr) helpedCoda = true;
			}
		}
		if (obj_cutscenemgr.helpedCoda) {
			helpedpauseTimer--;
			if (helpedpauseTimer <= 0) {
				if (x < 4120) {
					hsp = 1.5;	
					sprite_index = spr_oldman_walk;
					image_xscale = 1;
				} else {
						x = 4120;
						hsp = 0;
						sprite_index = spr_oldman_idle;
						image_index = -1;
						with (obj_cutscenemgr) oldmanbackOffEdgeComplete = true;	
				}
			}
		
			
		}
	}
		
	#endregion
	
	#region walking scene
	
	if (room == rm_walkingscene) {
		sprite_index = spr_oldman_walk;
		image_speed = 1;
		image_xscale = -1;
		
	}
	
	
	#endregion
	
#endregion


#region Horizontal friction
if (hsp != 0) hsp = approach(hsp, 0, 0.3);

#endregion

#region Gravity

if (vsp <= 0) vsp += grav; else vsp += 2*grav;

if (place_meeting(x,y+vsp,obj_boundary)) {
	while (!place_meeting(x,y+sign(vsp),obj_boundary)) {
		y += sign(vsp);	
	}
	vsp = 0;		//this is causing sprite to collide with the floor
}

//Unstick
if (place_meeting(x,y,obj_boundary)) {
	for (var i = 0; i < 100; ++i) {
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

y += vsp;
x += hsp;