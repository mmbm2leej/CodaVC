#region Refresh all statuses
fireballsOnce = false;
rolledStateRandom = false;
earthShaken = false;
#endregion

if (sprite_index != spr_miniboss) sprite_index = spr_miniboss;
if (mask_index != spr_miniboss) mask_index = spr_miniboss;

#region Manage Duration
if (!startNormalAlarm) {
	alarm[3] = 180;
	startNormalAlarm = true;
}

#endregion


#region Roll for next state

if (normalEnd) {
	if (!rolledStateRandom) {
		var rollRandomState = irandom_range(1,4);
		switch (rollRandomState) {
			case 0: mystate = miniBossState.normal; break;
			case 1: mystate = miniBossState.triOrb;	break;	
			case 2: mystate = miniBossState.claw; break;
			case 3: mystate = miniBossState.earthShake;	break;	
			case 4: mystate = miniBossState.shardFall;
		}	
		

	
		rolledStateRandom = true;
	}
}



#endregion