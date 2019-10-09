if (currentcharge != global.playerpowercurrent) {
	currentcharge += (global.playerpowercurrent - currentcharge)/5;
}

if (oldcharge != currentcharge) {
	oldcharge += (currentcharge - oldcharge)/20;
}

