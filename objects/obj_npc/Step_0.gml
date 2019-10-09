if (mystate == NPCSTATES.idle) {
	if (idlechoice < 2) {	//stand still
		sprite_index = myidlesprite;
	} else {	//walk
		sprite_index = mywalksprite;
		currentface = walkdirchoice;
		if (!place_meeting(x+(walkdirchoice*walkspd),y,obj_transitionboundary)) hsp = (walkspd * walkdirchoice);		
		else hsp = 0;
	}
} else if (mystate == NPCSTATES.speaking) {
	npc_speaking();
}

	

#region Gravity and Vertical Collision

if (!place_meeting(id.x,id.y+1,obj_boundary)) {
	vsp += grav;
} else {
	vsp = 0;
	image_xscale = currentface;
}



#endregion

x += hsp;
y += vsp;

