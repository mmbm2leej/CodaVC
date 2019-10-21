#region State Machine
mystate = ENEMYSTATE.idle;

#endregion

#region Type determination
//will have to make this conditional depending on the environment/room
myspawnchoice = choose(0,1);

myname = ds_grid_get(global.ds_ENEMYDB,0,myspawnchoice);
myidlesprite = ds_grid_get(global.ds_ENEMYDB,1,myspawnchoice);
mywalksprite = ds_grid_get(global.ds_ENEMYDB,2,myspawnchoice);
myrunsprite = ds_grid_get(global.ds_ENEMYDB,3,myspawnchoice);	//update this when we get running/chase sprites
myhpmax = ds_grid_get(global.ds_ENEMYDB,4,myspawnchoice);
mydamage = ds_grid_get(global.ds_ENEMYDB,5,myspawnchoice);
mywalkspd = ds_grid_get(global.ds_ENEMYDB,6,myspawnchoice);
myrunspd = ds_grid_get(global.ds_ENEMYDB,7,myspawnchoice);
myxpworth = ds_grid_get(global.ds_ENEMYDB,8,myspawnchoice);

#endregion

#region Stats and Variables

hsp = 0;
vsp = 0;
walkspd = mywalkspd;
runspd = myrunspd;
movespd = walkspd;
myhp = myhpmax;
gravdefault = 0.18;
grav = gravdefault;
jumpspd = -7;
currentface = 1;
deathshakecounter = 30;
myidlechoice = 0;
myidledirection = 1;
alarm[0] = 240;
invincible = false;
alpha = 1;
attacktimeron = false;
deathsoundplayed = false;

#endregion


mydetectionrange = 150;
mycombatrange = 20;
mydisengagerange = 350;
mycombatdisengage = 70;
alerttimermax = 90;
alerttimer = alerttimermax;
alert = false;
myattacktimer = 90;
canattack = false;

#region Knockup and Knockback

if (myname == "Hellbird") {
	
	myknockup = 5;
	myknockback = 1;
	
} else if (myname == "Spike Hound") {
	
	myknockup = 1;
	myknockback = 5;

}



#endregion