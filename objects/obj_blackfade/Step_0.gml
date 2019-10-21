
if (transtart) {
	stayblacktimer = stayblacktimermax;
	blackalpha = approach(blackalpha,1,0.04);
	if (blackalpha == 1) {
		with (obj_roomsequence) blackfaderdy = true;
	}
}

if (tranend) {
	stayblacktimer--;
	if (stayblacktimer <= 0) {
		blackalpha = approach(blackalpha,0,0.04);
		if (blackalpha == 0) tranend = false;
	}
}


