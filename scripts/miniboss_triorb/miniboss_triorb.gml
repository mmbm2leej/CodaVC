#region Refresh Normal State Variables
startNormalAlarm = false;
normalEnd = false;

#endregion



//spawn the orbs
if (!fireballsOnce) {
	alarm[0] = 30;
	fireballsOnce = true;
}


if (alarm[0] <= 0) {
	mystate = miniBossState.normal;
}