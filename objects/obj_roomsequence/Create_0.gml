doTransition = false;
targetRoom = -1;
targetx = 0;
targety = 0;
initloadok = false;
blackfaderdy = false;

if (!instance_exists(obj_blackfade)) instance_create_layer(0,0,"manageroverlayer",obj_blackfade);