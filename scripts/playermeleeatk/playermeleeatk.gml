#region Attacking
// Melee 
hsp = 0;

if (sprite_index != (spr_codameleefwd0)) {
	sprite_index = spr_codameleefwd0;
	image_index = 0;
	image_xscale = currentface;
	ds_list_clear(hitbyAttack);
	
}

mask_index = spr_codameleefwd0hb;

#region Play Melee 0 sound effect
if (!audio_is_playing(snd_melee0)) audio_play_sound(snd_melee0,0,false);


#endregion

var dmgInflict = global.playermeleedamage;
var combo_coeff = 0;
if (instance_exists(obj_combosys)) combo_coeff = obj_combosys.combocurrent;
var hitbyAttackNow = ds_list_create();
var hits = instance_place_list(x,y,obj_enemy,hitbyAttackNow,false);
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
ds_list_destroy(hitbyAttackNow);
mask_index = spr_codaidle;

//Trigger Combo
if ( (input_melee) && (image_index > 4) ) {
	currentattack++;
	mystate = PLAYERSTATE.meleecombo;	
}

if (animation_end()) {
	sprite_index = spr_codaidle;
	mystate = PLAYERSTATE.free;
}



if (!input_melee) currentattackrefreshtimer--;

if (currentattackrefreshtimer < 0) {
	currentattack = 0;
	currentattackrefreshtimer = currentattackrefreshtimermax;
	mystate = PLAYERSTATE.free;
	
}

#endregion