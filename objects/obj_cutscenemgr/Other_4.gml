#region If room is postCascade Cadenza East 0
	
if (room == rm_postCasCadEast0) {
	
	if (!(global.postCasPart1Watched)) {
		oldmanid = instance_create_layer(	4150,	1190,	"characterlayer",	obj_oldman);
		alarm[0] = 120;
		with (obj_player) {
			mystate = PLAYERSTATE.cutscene;	
		}
	}
}

#endregion

#region If room is walking scene
	
if (room == rm_walkingscene) {
	
	if (!instance_exists(obj_oldman)) 
		oldmanid = instance_create_layer(	640,	460,	"characterlayer",	obj_oldman);
		
	if (obj_player.mystate != PLAYERSTATE.cutscene) {
		with (obj_player) mystate = PLAYERSTATE.cutscene;	
	}
	
}


#endregion