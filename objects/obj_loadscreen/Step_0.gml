if (myState) {
	receivedcompletion = false;
	if (!completed) stayBlacktimer = stayBlacktimermax;
	myAlpha = approach(myAlpha, 1, 0.1);
	
	if (myAlpha == 1) {
		completed = true;		
		myState = false;
	}
	
} else if ((completed) && (receivedcompletion)) {
	stayBlacktimer--;
	if (stayBlacktimer <= 0) myAlpha = approach(myAlpha, 0, 0.05);
	
	if (myAlpha == 0) {
		completed = false;
	}
	
}