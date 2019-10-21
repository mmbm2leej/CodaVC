#region In the Main Menu

if (room == rm_mainmenu) {
	if (!audio_is_playing(mmTheme)) {
		
		audio_play_sound(mmTheme, 0, true);

	}
}

#endregion

#region What to do in Azaga

if (room == playareaAzaga) {
		
		#region If out of combat
		
		if (obj_player.outofcombat) {
			
			if (audio_is_playing(combatLoop)) {
				
				audio_sound_gain(combatLoop,0,600);

				if (audio_sound_get_gain(combatLoop) == 0) {
					audio_stop_sound(combatLoop);
				} 
					
			}
			sync = false;
			beatcounter = 0;
			
			if (!musicplaying) {
				songplayingname = audio_play_sound(azagabgm,0,true);
				audio_sound_gain(songplayingname, 0, 0);
				audio_sound_gain(songplayingname, 0.4, 5000);
				musicplaying = true;
			} else {
				if (obj_dialogmgr.dialoguestate) {
					if (audio_sound_get_gain(songplayingname) > 0.05) {
						audio_sound_gain(songplayingname,0.05,2000);
					} 
				} else {
					if (audio_sound_get_gain(songplayingname) < 0.4) {
						audio_sound_gain(songplayingname, 0.4, 5000);
					} 
				
				}
		
			}
			
		#endregion
		
		#region If in combat
		
		} else {
		
			if (audio_is_playing(sound_azaga_bgm)) {
				audio_sound_gain(sound_azaga_bgm, 0, 600);
				if (audio_sound_get_gain(sound_azaga_bgm) == 0) audio_stop_sound(sound_azaga_bgm);	
			}
		
			if (!audio_is_playing(msc_combatbeatloopph)) {
				var combatsong = audio_play_sound(msc_combatbeatloopph,10,true);
				audio_sound_gain(combatsong, 0, 0);
				audio_sound_gain(combatsong, 0.4, 5000);

			} else {
			
				beatcounter++;
				if ( (beatcounter >= 0) && (beatcounter <= 14) ) sync = true;
				else sync = false;
				if (beatcounter > 25) beatcounter = 0;
			}
		
			#endregion
		
	}

}

#endregion

#region In Cave Entrance

if (room == rm_caveentrance) {
	
	//if playable
	if (!(global.ch0endcutscene)) {
		if (!audio_is_playing(caveEntMusic)) {
			startSilent = true;
			audio_play_sound(caveEntMusic,0,true);
		} else {
			if (startSilent) {
				audio_sound_gain(caveEntMusic, 0 , 1);
				startSilent = false;
			}
			audio_sound_gain(caveEntMusic, 1 , 600);
		
		}
	} else {	//if cutscene ch0
		if (audio_is_playing(caveEntMusic)) {
			audio_sound_gain(caveEntMusic, 0 , 600);
		}
		
		if (instance_exists(obj_oldman)) {
			if (obj_oldman.hidden) {
					if (!cascadeTripped) {
						audio_play_sound(cascadeID,-10,false);	
						cascadeTripped = true;
					} else {
						if (	cascadeTripped && (!audio_is_playing(cascadeID))	)
							cascadeOver = true;
					
					}

			}
		
		}
	}

}




#endregion

#region Post Cas Part 1
if (!(global.postCasPart1Watched)) {
	
	if (room == rm_postCasCadEast0) {
		
		if (postcadpart1sadthemeTrigger) {
			if (!audio_is_playing(sadtheme0)) {
				audio_sound_gain(sadtheme0,0,1);
				audio_play_sound(sadtheme0,0,true);
			} else {
				audio_sound_gain(sadtheme0,1,600);
			}
		}
		
	}
	
	
}



#endregion