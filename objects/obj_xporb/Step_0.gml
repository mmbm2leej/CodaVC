#region //Collection

var player = instance_nearest(x,y,obj_player);
var cp1dist = point_distance(id.x,id.y,cp1destx,cp1desty);
if (cp1dist < 6) checkpoint1 = true;


if (!checkpoint1) {
	id.y += (cp1desty - id.y)/10; 
	id.x += (cp1destx - id.x)/10;
} else {
	if (deathbuffertimer > 0) deathbuffertimer--;
	if (!place_meeting(x,y+1,obj_boundary)) {
		y += grav;
		grav += 0.5;
	}
}

if (deathbuffertimer <= 0) {
	if (player != noone) {
		if (point_distance(id.x,id.y,player.x,player.y) <= gatherrange) {
			direction = point_direction(id.x,id.y,player.x,player.y-50);
			var dist = point_distance(id.x,id.y,player.x,player.y);
			spd = maxspd * (gatherrange/dist);
			speed = spd;
		
		}
	
	}
	
}



#endregion

#region If collected
if (place_meeting(id.x,id.y,player)) {
	global.playerxpcurrent += 5;
	audio_play_sound(snd_boop,0,false);
	instance_destroy();
	
}




#endregion