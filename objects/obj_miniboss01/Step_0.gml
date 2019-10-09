id.y = wave(spawnedy-20, spawnedy+20, 10, 0);

if (active) {
	
	switch (mystate) {
		case miniBossState.normal:		miniboss_atk();		break;
		case miniBossState.special0:	miniboss_spec0();	break;	
		case miniBossState.special1:	miniboss_spec1();	break;
		case miniBossState.special2:	miniboss_spec2();	break;
		case ENEMYSTATE.takingdmg: enemy_invuln(); break;
		case ENEMYSTATE.death: dead = true;
		
	}
	if (alarm[0] <= 0) alarm[0] = 240;
}




#region On death


if (myhp == 0) {
	with (obj_player) {
		inBossFight = false;		
	}
	instance_destroy();
}

#endregion

