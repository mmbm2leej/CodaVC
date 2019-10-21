#region Shake test
//if (keyboard_check_pressed(ord("L"))) shakemagnitude = 10;

#endregion

#region Positioning

x += (xTo - x)/12;
y += (yTo - y)/12;

if (follow != noone) {
	xTo = follow.x + camahead;
	yTo = follow.y-160;
}

if (room_width/2 <= 960) {
	xTo = room_width/2;
	yTo = room_height/2;	
} else 

if (room != rm_postCasCadEast0)  {
	if (instance_exists(obj_player)) {
		var player = instance_find(obj_player,0);
		var miniboss = noone;
		if (instance_exists(obj_miniboss01)) miniboss = instance_find(obj_miniboss01,0);
		if (	 (obj_player.inBossFight) && (miniboss != noone)	)	{
				follow = noone;
				xTo = (obj_player.x + miniboss.x)/2;
				yTo = (obj_player.y + miniboss.y)/2;
		} else {
			follow = player;
		}
	}
}

#endregion

#region Parallax
if (room != rm_walkingscene) {
	
	#region Land Backgrounds
	var bg0 = layer_get_id("bglayer0");
	var bg1 = layer_get_id("bglayer1");
	var bg2 = layer_get_id("bglayer2");
	var bg3 = layer_get_id("bglayer3");

	layer_x(bg0,obj_camera.x* 0.8);
	layer_x(bg1,obj_camera.x* 0.9);
	layer_x(bg2,obj_camera.x* 0.95);
	layer_x(bg3,obj_camera.x);

	#endregion 

	#region Cloud Backgrounds

	var cloudlow = layer_get_id("bglowcloud");
	var cloudmid = layer_get_id("bgmidcloud");
	var cloudhigh = layer_get_id("bghighcloud");


	layer_x(cloudlow,obj_camera.x);
	layer_x(cloudmid,obj_camera.x+500);
	layer_x(cloudhigh,obj_camera.x+200);

	#endregion
	
}

#region Zooms

if (instance_exists(obj_player)) {	
	if (obj_player.inBossFight) {
		if (motionzoomrunx < motionzoomrunmax_x) {
			motionzoomrunx += 1.7;
		} else motionzoomrunx = motionzoomrunmax_x;
		
		if (motionzoomruny < motionzoomrunmax_y) {
			motionzoomruny++;
		} else motionzoomruny = motionzoomrunmax_y;
	
	} else 
	
	
	if (	 (abs(obj_player.hsp) > 0)	 ||	 (abs(obj_player.vsp) > 0)	)  && (obj_player.movespd == obj_player.runspd) {
		camahead = -100 * obj_player.currentface;
		if (motionzoomrunx < motionzoomrunmax_x) {
			motionzoomrunx += 1.7;
		} else motionzoomrunx = motionzoomrunmax_x;
		
		if (motionzoomruny < motionzoomrunmax_y) {
			motionzoomruny++;
		} else motionzoomruny = motionzoomrunmax_y;
	
		//motionzoomrunmax = 200;
		//motionzoomrun = 0;
		
	} else {
		
		if (motionzoomrunx > 0) motionzoomrunx -= 3.4; else motionzoomrunx = 0;
		if (motionzoomruny > 0) motionzoomruny-=2; else motionzoomruny = 0;
		camahead = -40 * obj_player.currentface;
		
	}
	camera_set_view_size(cam,960+motionzoomrunx,540+motionzoomruny);	
}



#endregion

#region Cave backgrounds

if (room == rm_caveentrance) {
var caveback = layer_get_id("Backgrounds_1");


layer_x(caveback,obj_camera.x* 0.85);
layer_y(caveback,obj_camera.y* 0.85);
}

#endregion

#endregion

#region Shakes!

if (shakemagnitude>0) {
	shake = irandom_range(-3,3);
	id.x += shake; id.y += shake;
	shakemagnitude = lerp(shakemagnitude,0,0.5);
} else {
	shake = 0;
}


#endregion

#region For cutscenes
	
	#region Chapter 0 cutscene
	if (room == rm_caveentrance) {
		if (global.ch0endcutscene) {
				//turn on the Cascade Event
				if (audio_is_playing(snd_cascade)) shakemagnitude = 40;
			
		}
	}
	#endregion
	
	#region postCascadePart1ZoomOut
	if (room == rm_postCasCadEast0) {
		
		if (postCascadePart1ZoomOut) {
			camXsize = approach(camXsize,2560,1.778);
			camYsize = approach(camYsize,1440,1);
			follow = noone;
			if (yTo < 1500) yTo+= 0.5; else yTo = 1500;
			camera_set_view_size(cam,camXsize,camYsize);	
		
			if (camXsize == 2560) {
				with (obj_cutscenemgr) {
					zoomComplete = true;	
				}
			
			}

		} else {
			id.x = 4060; id.y = 1180; xTo = 4060; yTo = 1180;
		}
	} 
	
	#endregion
	
	#region the walking scene
	/*
	if (room == rm_walkingscene) {
		var layerPath = layer_get_id("path");
		var layerbg0 = layer_get_id("bg_0");
		var layerbg1 = layer_get_id("bg_1");

		layer_x(layerPath,layer_get_x(layerPath)+3);
		layer_x(layerbg0,layer_get_x(layerbg0)+2);
		layer_x(layerbg1,layer_get_x(layerbg1)+1);

		
	}
	*/
	#endregion


#endregion

var vm = matrix_build_lookat(id.x,id.y,-10,id.x,id.y,0,0,1,0);
camera_set_view_mat(cam,vm);

//id.x = clamp(x,540,room_width-540);
//id.y = clamp(y,280,(room_height-270));





