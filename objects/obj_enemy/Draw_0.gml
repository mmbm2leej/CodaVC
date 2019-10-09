//if (sprite_index > 0) draw_self();

if (instance_exists(obj_debug)) {
	if (obj_debug.debugmode) {
		draw_text(id.x,id.bbox_top-40,myhp);
		draw_text(id.x,id.bbox_top-70,"hsp: ");
		draw_text(id.x+40,id.bbox_top-70,hsp);
		switch (mystate) {
			
			case 0: draw_text(id.x,id.bbox_top-100,"idle"); break; 
			case 1: draw_text(id.x,id.bbox_top-100,"chase"); break; 
			case 2: draw_text(id.x,id.bbox_top-100,"combat"); break; 
			case 3: draw_text(id.x,id.bbox_top-100,"flee"); break; 
			case 4: draw_text(id.x,id.bbox_top-100,"takingdmg"); break; 
			case 5: draw_text(id.x,id.bbox_top-100,"death"); break; 
			case 6:	draw_text(id.x,id.bbox_top-100,"alert");

		}
		draw_text(id.x,id.bbox_top-130,"runspd : ");
		draw_text(id.x+80,id.bbox_top-130,runspd);
		
		draw_text(id.x,id.bbox_top-160,"canattack : ");
		draw_text(id.x+80,id.bbox_top-160,canattack);
		draw_text(id.x,id.bbox_top-190,"invincible : ");
		draw_text(id.x+80,id.bbox_top-190,invincible);
		
	}
}

#region Taking damage

var _invulnInterval =  8;
if ( (alarm[2] % _invulnInterval) <= _invulnInterval/2) {

	if (sprite_index >= 0) {
		gpu_set_fog(false,c_white,0,1);
		draw_sprite_ext(sprite_index,image_index,id.x,id.y,image_xscale,1,0,c_white,alpha);
	}
	
} else {

	if (sprite_index >= 0) {
		gpu_set_fog(true,c_white,0,1);
		draw_sprite_ext(sprite_index,image_index,id.x,id.y,image_xscale,1,0,c_white,alpha);
	}
	
}

gpu_set_fog(false,c_white,0,1);

#endregion


	


