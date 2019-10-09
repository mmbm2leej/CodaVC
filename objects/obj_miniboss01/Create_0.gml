#region Stats

myhp = 180;
myregen = 5;
spawnedy = id.y;
active = false;
dead = false;
invincible = false;
alpha = 1;


//Loot on death
/*
money
shield powerup
*/

enum miniBossState {
	normal = 0,	
	special0 = 1,
	special1 = 2,
	special2 = 3
}

mystate = miniBossState.normal;


#endregion