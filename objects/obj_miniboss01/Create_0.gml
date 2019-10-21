#region Stats

myhp = 180;
myregen = 5;
spawnedy = id.y;
active = false;
dead = false;
invincible = false;
alpha = 1;
myxpworth = 60;



//Loot on death
/*
money
shield powerup
*/

enum miniBossState {
	normal = 0,	
	triOrb = 1,
	claw = 2,
	earthShake = 3,
	shardFall = 4,
	takedmg = 5,
	death = 6
}

mystate = miniBossState.normal;


#endregion

#region State variables

fireballsOnce = false;
rolledStateRandom = false;
startNormalAlarm = false;
normalEnd = false;

#endregion