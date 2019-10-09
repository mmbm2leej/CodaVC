hsp = 0;

didshoot = true;
sprite_index = spr_codafire;
image_speed = 1;
var currentdir = currentface;
var correctx = id.x+(-30*currentface);
var correcty = id.y-(80);
if (image_index >= 10) && (image_index <= 12) {
	didshoot = false;
}

if (!didshoot) {
	var myshot = instance_create_layer(correctx,correcty,"projectilelayer",obj_laser);
	with (myshot) {
		image_xscale = currentdir;
	}
	if (obj_camera.shakemagnitude == 0) {
		obj_camera.shakemagnitude = 10;
	}
	didshoot = true;
} else {
	if (animation_end()) {
		didshoot = false;
		mystate = PLAYERSTATE.free;
	}
}