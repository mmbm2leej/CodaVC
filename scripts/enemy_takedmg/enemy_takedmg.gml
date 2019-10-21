///@description enemy_takedmg(damage_value, combo_multiplier)
///@arg damage_value
///@arg combo_multiplier

if (myhp > 0) {
	var dmgToTake = argument0;
	if (argument1 > 0) {
		dmgToTake *= (1 + (argument1 / 72));
	}
	var myY = id.y - 200;
	var myX = id.x;
	var damageStr = string_format(dmgToTake,1,0);
	var myDamageTaken = instance_create_layer(myX,myY,"guilayer",obj_damageIndicator);
	with (myDamageTaken) {
		currenty = yBegin;
		currentstring = damageStr;
	}

	hsp = 0;
	vsp = 0;
	myhp -= dmgToTake;
}

if (myhp > 0) mystate = ENEMYSTATE.takingdmg;
else mystate = ENEMYSTATE.death;


