

if (		(room == cadenzaEast0)	/*	||		(room == cadenzaWest0)	*/	) {
	if (instance_exists(obj_globalvarbank)) {
		if (instance_number(obj_enemy) < 4) {
			var enemyspawn = instance_create_layer(random_range(200,1800),	420, "characterlayer", obj_enemy);
		}
	}
}