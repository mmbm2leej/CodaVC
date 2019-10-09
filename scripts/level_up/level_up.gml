//if (global.playerxpcurrent >= global.playernextlevelxp) {
	global.playercurrentlevel++;
	var remainder = global.playerxpcurrent % global.playernextlevelxp;
	global.playernextlevelxp *= 1.618;
	global.playernextlevelxp = round(global.playernextlevelxp);
	global.playerxpcurrent = remainder;
	if (!audio_is_playing(snd_levelup_ph)) {
		audio_play_sound(snd_levelup_ph,-10,false);
	}
	

//}

