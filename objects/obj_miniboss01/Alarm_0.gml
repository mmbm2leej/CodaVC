/// @description Fireball

var thisBall0 = instance_create_layer(id.x - 100,id.y - 100,"projectilelayer",obj_fireball);
var thisBall1 = instance_create_layer(id.x,		id.y - 150,"projectilelayer",obj_fireball);
var thisBall2 = instance_create_layer(id.x + 100,id.y - 100,"projectilelayer",obj_fireball);


with (thisBall0) {
	myTarget = obj_player;
}


with (thisBall1) {
	alarm[0] = 120;
	myTarget = obj_player;
}

with (thisBall2) {
	alarm[0] = 150;
	myTarget = obj_player;
}