#region States management

switch mystate {
	case ENEMYSTATE.idle: enemy_idle(); break;
	case ENEMYSTATE.chase: enemy_chase(); break;
	//change this to a running/chase sprite once received
	case ENEMYSTATE.alert: enemy_alert(); break;
	case ENEMYSTATE.combat: enemy_combat(); break;
	case ENEMYSTATE.takingdmg: enemy_invuln(); break;
	case ENEMYSTATE.flee: enemy_flee(); break;
	case ENEMYSTATE.death: enemy_death(); 
	
}


#endregion

#region Always happens

if (!place_meeting(x,y+1, obj_boundary)) {
	y++;	
} 

#region Unsticking this object


if (place_meeting(x,y,obj_boundary)) {
	for (var i = 0; i < 200; ++i) {
		//Check up
		if (!place_meeting(x,y-i,obj_boundary)) {
			y-=i;
			break;
		}

		
		//Check left
		if (!place_meeting(x - i,y,obj_boundary)) {
			x-=i;
			break;
		}
		
		//Check right
		if (!place_meeting(x + i,y,obj_boundary)) {
			x+=i;
			break;
		}
		
		//Check down
		if (!place_meeting(x,y + i,obj_boundary)) {
			y+=i;
			break;
		}
		
	}
}

#endregion

#endregion

#region Gravity

if (vsp <= 0) vsp += grav; else vsp += 2*grav;

if (place_meeting(x,y+vsp,obj_boundary)) {
	while (!place_meeting(x,y+sign(vsp),obj_boundary)) {
		y += sign(vsp);	
	}
	vsp = 0;		//this is causing sprite to collide with the floor
}




#endregion

x += hsp;
y += vsp;

#region Death failsafe

if (mystate != ENEMYSTATE.takingdmg) {
	if (myhp <= 0) mystate = ENEMYSTATE.death;
}

#endregion

#region Keeping alerttimer fresh whenever not in use
if (mystate != ENEMYSTATE.alert) {
	
	if (alerttimer != alerttimermax) alerttimer = alerttimermax;	
	
}


#endregion

#region Haul ass when almost dead

//Current set to trigger flee if hp is less than 10%
if ((myhp < (myhpmax * 0.1)) && (myhp > 0)) mystate = ENEMYSTATE.flee;


#endregion
