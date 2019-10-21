#region Chapter 0 end cutscene

if (global.ch0endcutscene) {
	if (global.ch0endcutscenetimer < 180) global.ch0endcutscenetimer++;
	
	if (global.ch0endcutscenetimer >= 180) {
		
		if (!createdoldman) {
			oldmanid = instance_create_layer(	96,	1110,	"characterlayer",	obj_oldman);
			createdoldman = true;
		}
		
	}
}


#endregion

#region Post Cascade Part 1
if (room == rm_postCasCadEast0) {
	if (helpedCoda) {
		if (pauseAfterHelpTimer > 0) pauseAfterHelpTimer--;
		else {
			backOffEdge = true;
			playerRunToEdge = false;
			playeratEdge = false;
		}
	}

	if (	 (oldmanbackOffEdgeComplete) && (playerbackOffEdgeComplete)		)	{
		playerLookOutEdgeTimer--;
		if (playerLookOutEdgeTimer < 0) {
			playerLookOutEdge = true;	
		}
	}

	#region When the player looks out at the edge
	if (playerLookOutEdge) {

		with (obj_camera) postCascadePart1ZoomOut = true;	
	
		with (obj_musicmanager) postcadpart1sadthemeTrigger = true;
	
		if (zoomComplete) {
			with (obj_roomsequence) {
				if (!doTransition) {
					targetRoom = rm_walkingscene;
					targetx = 240;
					targety = 440;
					doTransition = true;
				}
			}
		}
	}
	#endregion
}


#endregion