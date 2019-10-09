if (animation_end()) {
	image_speed = 0;
	image_index = 8;
	countdown = true;
}

if (countdown) timer--;
if (timer <= 0) instance_destroy();

if (y < starty) {
	vsp += bounce_coeff;
	bounce_coeff += 0.1;
	y += vsp;
} else y = starty; 

