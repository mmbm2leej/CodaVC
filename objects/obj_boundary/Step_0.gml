if (instance_exists(obj_debug)) {
	if (obj_debug.debugmode) {
		image_alpha = 0.7;	
	} else image_alpha = 0;
}


if (amBossBoundary) {
	
	#region in chapter 0
	if (room == rm_caveentrance) {
		if (!instance_exists(obj_miniboss01)) {
			instance_destroy();
	
		}
	}
	#endregion
	
}