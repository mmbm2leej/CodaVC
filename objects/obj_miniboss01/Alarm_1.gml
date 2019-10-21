/// @description earthshake attack
if (!instance_exists(obj_earthshake)) {
	if (instance_exists(obj_player)) instance_create_layer(obj_player.x,2880,"projectilelayer",obj_earthshake);

}