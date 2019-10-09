#region XP Management

#region XP bar update

xpnew = global.playerxpcurrent;

if (xpold != xpnew) {
	fadetimer = fadetimerdefault;
	xpold += (xpnew - xpold)/20;
}

if (instance_exists(obj_player)) {

	if (fadetimer > 0) {
		fade = approach(fade, 1, 0.1);
		fadetimer--;
	} else fadetimer = 0;

	if (fadetimer <= 0) {
		fade = approach(fade, 0, 0.05);
	}
	
} else {
	fade = 0;
}

if (levelup) {
	
	if (alphagaptimer > 0) alpha = approach(alpha,1,0.1);
	if (alpha == 1) alphagaptimer--;
	if (alphagaptimer <= 0) alpha = approach(alpha,0,0.02);

} 
if (alphagaptimer <= 0) && (alpha == 0) {
	
	levelup = false;
	alphagaptimer = alphagaptimerdefault;	
}

#endregion

#region Whenever the player levels up

if (global.playerxpcurrent >= global.playernextlevelxp) {
	level_up();
	levelup = true;
} 

#endregion

#region Particle effect for leveling up
if (keyboard_check(ord("T"))) {
    var _dir = random(360);
    var _dist = 300;
    var _x = to_x + lengthdir_x(_dist,_dir);
    var _y = to_y + lengthdir_y(_dist,_dir);
    var _part_dir = point_direction(_x,_y,to_x,to_y);
    part_type_direction(part,_part_dir,_part_dir,0,0);
    part_particles_create(system,_x,_y,part,1);
}

#endregion

#endregion


if (instance_exists(obj_player)) {
	var player = instance_find(obj_player,0);
	to_x = player.x;
	to_y = player.y;
}