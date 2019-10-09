var partner = instance_place(x,y,obj_enemy);
var currentmydmg = mydamage;

if (!hitonce) {
	with (partner) {
		myhp -= currentmydmg;
	}
	hitonce = true;
}