#region In the Main Menu

if (room == rm_mainmenu) {
	if (!audio_is_playing(snd_mainMenuTheme)) {
		
		audio_play_sound(snd_mainMenuTheme, 0, true);

	}
}

#endregion

#region What to do in Azaga

if (room == playareaAzaga) {
		
		#region If out of combat
		
		if (obj_player.outofcombat) {
			
			if (audio_is_playing(msc_combatbeatloopph)) {
				
				audio_sound_gain(msc_combatbeatloopph,0,600);

				if (audio_sound_get_gain(msc_combatbeatloopph) == 0) {
					audio_stop_sound(msc_combatbeatloopph);
				} 
					
			}
			sync = false;
			beatcounter = 0;
			
			if (!musicplaying) {
				songplayingname = audio_play_sound(sound_azaga_bgm,0,true);
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
	
	if (!audio_is_playing(snd_codenzapt1)) {
		startSilent = true;
		audio_play_sound(snd_codenzapt1,0,true);
	} else {
		if (startSilent) {
			audio_sound_gain(snd_codenzapt1, 0 , 1);
			startSilent = false;
		}
		audio_sound_gain(snd_codenzapt1, 1 , 5000);
		
	}
	
}




#endregion

