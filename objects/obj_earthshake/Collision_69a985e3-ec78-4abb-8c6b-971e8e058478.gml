if (!obj_player.invincible) {
	global.playercurrenthp -= mydamage;
	var hspmodifier = 0.4;
	var knockup = myknockup;
	if (id.x >= obj_player.x) hspmodifier = -0.4; 
	with (obj_player) {
		vsp += ( -1 * (knockup) );
		outofcombat = false;
		tookrecenthit = true;
		invincible = true;
		mystate = PLAYERSTATE.tookdmg;
	}
	instance_destroy();
}

