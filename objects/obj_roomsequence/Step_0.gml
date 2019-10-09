if (room == room0) {
	if (initloadok) room_goto_next();
}

if (doTransition) {
	with (obj_blackfade) transtart = true;
	if (blackfaderdy) {
		room_goto(targetRoom);
		doTransition = false;
	}
} else {
	if (room == targetRoom) && (!instance_exists(obj_player)) {
		instance_create_layer(targetx,targety,"playerlayer",obj_player);	
	}
	with (obj_blackfade) {
		transtart = false;
		tranend = true;
	}
}