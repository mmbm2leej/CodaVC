if ((mouse_x > bbox_left) && (mouse_x < bbox_right) && (mouse_y > bbox_top) && (mouse_y < bbox_bottom)) {
	if (mouse_check_button_pressed(mb_left)) {
		if (!audio_is_playing(myclicksound)) audio_play_sound(myclicksound,0,false);
		pressed = true;	
	}
}




if ((mytext == "New Game") && (pressed == true)) room_goto(rm_introCutscene0);

//if ((mytext == "Settings") && (pressed == true)) room_goto(settings);

if ((mytext == "Exit") && (pressed == true)) game_end();