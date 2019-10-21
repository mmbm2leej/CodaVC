if (!audio_is_playing(snd_collect0)) audio_play_sound(snd_collect0,0,false);

if (chapter0item) {
	var newCutscene = instance_create_layer(190,920,"boundarylayer",obj_cutscenehitbox);
	with (newCutscene) {
		image_xscale = 4;
		image_yscale = 12;
		chapter0ender = true;
		active = true;

	}

}


instance_destroy();