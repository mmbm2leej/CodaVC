left = 0;
bot = 0;
fadetimerdefault = 120;
fadetimer = fadetimerdefault;
fade = 0;


xpbarsizemaxmult = 8;

guixpos = 96;
guiypos = 420;

basesize = 32;

xpnew = global.playerxpcurrent;
xpold = xpnew;
levelup = false;
alpha = 0;
alphagaptimerdefault = 200;
alphagaptimer = alphagaptimerdefault;
to_x = 0;
to_y = 0;


#region Particle Definition

///Particle Test
system=part_system_create();
part_system_depth(system,-10);

part = part_type_create();
part_type_shape(part,pt_shape_disk);
part_type_speed(part,5,10,.1,0);
part_type_colour1(part,c_black);
part_type_life(part,30,50);
part_type_size(part,1,1,-.02,0);

#endregion

