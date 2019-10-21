id.y = wave(spawnedy-20, spawnedy+20, 10, 0);

if (active) {
	
	switch (mystate) {
		case miniBossState.normal:		miniboss_defend();		break;
		case miniBossState.triOrb:	miniboss_triorb();	break;	
		case miniBossState.claw:	miniboss_claw();	break;
		case miniBossState.earthShake:	miniboss_earthshake();	break;
		case miniBossState.shardFall:	miniboss_shardfall();	break;
		case miniBossState.takedmg: enemy_invuln(); break;	//needs its own script
		case miniBossState.death: dead = true;
	}
}


#region On death

//this needs a death animation at some point
if (myhp <= 0) {
	if (myxpworth > 0) {
		instance_create_layer(id.x,id.y,"projectilelayer",obj_xporb);
		myxpworth -= 5;
	} else {
		with (obj_player) {
			inBossFight = false;		
		}

		instance_destroy();
	}
}

#endregion

