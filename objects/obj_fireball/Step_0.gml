if (	(updateOnce) && (shoot)	)  {
	traceDur--;
	if (traceDur > 0) {
		direction = point_direction(id.x,id.y,myTarget.x + randx,myTarget.y+randy-60);
	} else {
		updateOnce = false;	
	}

}

if (shoot) {
	speed = myspeed;
	lifetime--;
}



#region If colliding

	#region if touching terrain
		if (place_meeting(x,y,obj_boundary)) instance_destroy();
	#endregion
	
	#region if hitting the player
	if (place_meeting(x,y,obj_player)) {
		if (!obj_player.invincible) {
			global.playercurrenthp -= mydamage;
			var hspmodifier = 0.4;
			var knockback = myknockback;
			var knockup = myknockup;
			if (id.x >= obj_player.x) hspmodifier = -0.4; 
			with (obj_player) {
				hsp += -1*(hspmodifier * knockback);
				vsp += ( -1 * (knockup) );
				outofcombat = false;
				tookrecenthit = true;
				invincible = true;
				mystate = PLAYERSTATE.tookdmg;
			}
		instance_destroy();
		}
	}
	#endregion

#endregion

#region Lifetime


if (lifetime <= 0) {
	instance_destroy();
}


#endregion