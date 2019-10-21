if (room == room0) {
	if (initloadok) room_goto_next();
}

if (doTransition) {
	with (obj_blackfade) transtart = true;
	if (	(blackfaderdy) && (obj_blackfade.blackalpha == 1)	) {
		room_goto(targetRoom);
		doTransition = false;
	}
} else {
	with (obj_blackfade) {
		transtart = false;
		tranend = true;
	}
}

#region shortcuts (remove this on release)
if (room == rm_mainmenu) {
	
	#region skipping to cave
	if (keyboard_check_pressed(ord("0"))) {
		//skip to the cave
		if (!doTransition) {
			targetRoom = rm_caveentrance;
			targetx = 250;
			targety = 1050;
			doTransition = true;
		}
	}
	#endregion
	
	#region skipping to postcascadeast0
		if (keyboard_check_pressed(ord("9"))) {
		//skip to the cave
		if (!doTransition) {
			targetRoom = rm_postCasCadEast0;
			targetx = 4170;
			targety = 1140;
			doTransition = true;
		}
	}
	#endregion
		
	

}


#endregion