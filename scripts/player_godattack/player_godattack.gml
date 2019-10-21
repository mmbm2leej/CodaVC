hsp = 0;

didshoot = true;
sprite_index = spr_codafire;
image_speed = 1;
var currentdir = currentface;
var correctx = id.x+(-30*currentface);
var correcty = id.y-(80);
if (image_index >= 10) && (image_index <= 12) {
	didshoot = false;
}

if (!didshoot) {
	mask_index = spr_godcircle;
	var dmgInflict = 99999;
	var combo_coeff = 0;
	if (instance_exists(obj_combosys)) combo_coeff = obj_combosys.combocurrent;
	var hitbyAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,obj_enemy,hitbyAttackNow,false);
	var bosshits = instance_place_list(x,y,obj_miniboss01,hitbyAttackNow,false);
	if (hits > 0) {
		for (i = 0; i < hits; ++i) {
			//if the instance is not hit by the attack yet
			var hitID = hitbyAttackNow[| i];
			if (ds_list_find_index(hitbyAttack,hitID) == -1) {
				ds_list_add(hitbyAttack,hitID);
				with (hitID) {
					if (!invincible) enemy_takedmg( dmgInflict, combo_coeff);
				}
			}
		}
	}
	if (bosshits > 0) {
		for (i = 0; i < bosshits; ++i) {
			//if the instance is not hit by the attack yet
			var hitID = hitbyAttackNow[| i];
			if (ds_list_find_index(hitbyAttack,hitID) == -1) {
				ds_list_add(hitbyAttack,hitID);
				with (hitID) {
					if (!invincible) enemy_takedmg( dmgInflict, combo_coeff);
				}
			}
		}
	}
	ds_list_destroy(hitbyAttackNow);
	mask_index = spr_codaidle;

} else {
	if (animation_end()) {
		didshoot = false;
		mystate = PLAYERSTATE.free;
	}
}