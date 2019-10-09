#region Movement Variables
hsp = 0;
vsp = 0;
walkspd = 1;
runspd = 3.5;	//make this 2.4 later
movespd = runspd;
gravdefault = 0.18;
grav = gravdefault;
jumpspd = -7;
currentface = 1;
idletimermax = 18000;
idletimer = idletimermax;
horizontalfriction = 0.03;

enum PLAYERSTATE {
	free = 0,
	melee = 1,
	meleecombo = 2,
	ranged = 3,
	longidle = 4,
	death = 5,
	jumprise = 6,
	speaking = 7,
	fall = 8,
	tookdmg = 9,
}

didshoot = false;
shooting = false;
jumping = false;
landing = false;
outofcombat = true;
outofcombattimermax = 300;
outofcombattimer = outofcombattimermax;
invincible = false;
audioplay = false;

redflashalpha = 0;

mystate = PLAYERSTATE.free;


#endregion

#region Player stats

myhealth = 30;
tookrecenthit = false;
laserpowercost = 8;


#endregion

#region Attack States
currentattack = 0;
currentattackrefreshtimermax = 90;
currentattackrefreshtimer = currentattackrefreshtimermax;
hitbyAttack = ds_list_create();

#endregion

#region Fighting boss states
inBossFight = false;

#endregion
