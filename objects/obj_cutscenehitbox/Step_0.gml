if (instance_exists(obj_debug)) {
	if (obj_debug.debugmode) {
		image_alpha = 1;	
	} else image_alpha = 0;
}

#region Boss Trigger

if (watched) {
	
	if (amBossTrigger) {
		alarm[0] = 240;
		amBossTrigger = false;		//it used up the trigger ONCE
	}
}

#endregion

#region On collision with player
if (place_meeting(x,y,obj_player)) {
	if (id == inst_1602145D) {
		with (obj_player) inBossFight = true;
		var bossLeftGate = instance_create_layer(1184,2686,"boundarylayer",obj_boundary);
		var bossRightGate = instance_create_layer(3070,2686,"boundarylayer",obj_boundary);
		with (bossLeftGate) {
			amBossBoundary = true;
			image_yscale = 3;
		}
		with (bossRightGate) {
			amBossBoundary = true;
			image_yscale = 3;
		}
	}
	
	if (chapter0ender) {
		
		with (obj_camera) follow = noone;
		/*
		with (obj_player) {
			mystate = PLAYERSTATE.cutscene;
		}
		
		if (!global.ch0endcutscene) {

		}
		*/
		global.ch0endcutscene = true;
	}

	
	#region Triggering flags
	if (myflag != noone) {
		#region Cave Cutscenes
		if (room == rm_caveentrance) {
			global.caveentrance_cutsceneplayed[myflag] = true;
		}
		#endregion
	}
	#endregion
}

#endregion