#region Refresh Normal State Variables
startNormalAlarm = false;
normalEnd = false;

#endregion



if (!earthShaken) {
	alarm[1] = 240;
	earthShaken = true;
} else {
	if (instance_exists(obj_camera)) {
		var inversealarm = 1/(alarm[1]);
		if (alarm[1] > 90) {
			with (obj_camera) shakemagnitude = 240/inversealarm; 	
		}
		
	}
	
}

if (alarm[1] <= 0) {
	mystate = miniBossState.normal;
}