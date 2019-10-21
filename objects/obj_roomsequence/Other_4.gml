#region Placing the player object in playable rooms

if (room == targetRoom) && (!instance_exists(obj_player)) {
	if (room != rm_introCutscene0) {
		instance_create_layer(targetx,targety,"playerlayer",obj_player);	
	}
}

#endregion