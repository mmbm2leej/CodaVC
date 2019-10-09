

//hpbaralpha = 0;
//healthbarsizemaxmult = 8;
guixpos = 128;
guiypos = 64;
basesize = 72;

nodehealth = 20;
hpold = global.playercurrenthp;
hpnew = global.playercurrenthp;
hpmax = global.playermaxhp;
nodecount = hpmax/nodehealth;
fullnodes = 0;
leadnode = 0;
leadnodehp = 0;
visualleadnodehp = nodehealth;


//Particle System

system=part_system_create();
part_system_depth(system,-100);

part=part_type_create();
part_type_shape(part,pt_shape_disk);
part_type_speed(part,2,8,.1,0);
part_type_colour3(part,c_aqua,c_blue,c_white);
part_type_life(part,20,30);
part_type_size(part,.1,1,-.01,0);
part_type_alpha3(part,0.1,0.3,0);

