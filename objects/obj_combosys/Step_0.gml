input_beat = (keyboard_check_pressed(vk_control));

#region Whenever the player input_beats
if (input_beat) {
	
	//If the input syncs to the beat
	if (obj_musicmanager.sync) {
		combocurrent++;
		alarm[0] = 180;
	}
	
	//If the input does NOT sync to the beat
	else {
		combocurrent = 0;
	}
}

#endregion


