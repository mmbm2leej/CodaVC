#region Death animation
if (myxpworth > 0) {
	instance_create_layer(id.x,id.y,"projectilelayer",obj_xporb);
	myxpworth -= 5;
}

var shakeamt = irandom_range(-2,2);
if (deathshakecounter >= 0) {
	deathshakecounter--;
	id.x += shakeamt;
	id.y += shakeamt;
	if (!deathsoundplayed) {
		if (!audio_is_playing(snd_enemydeath00)) audio_play_sound(snd_enemydeath00,0,false);
		deathsoundplayed = true;
	}
} else {
	if (alpha > 0) alpha = approach(alpha,0,0.01);
}

if ((deathshakecounter < 0) && (alpha <= 0)) instance_destroy();

#endregion


