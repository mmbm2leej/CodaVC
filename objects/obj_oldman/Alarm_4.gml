/// @description Start the dialogue after hiding

/*
with player {
	state = free;
}

create cutscenebox for the dialogue at around (350,1050)
*/
with (obj_dbox) {
	portraitleft = spr_oldmandialogue;
	portraitright = spr_codadialogue;
	speakerLeftSound = snd_elder_text;
	speakerRightSound = snd_coda_text;	
}

var postCascadeDialogue = instance_create_layer(350,1000,"boundarylayer",obj_cutscenehitbox);
with (postCascadeDialogue) {
	image_xscale = 4;
	image_yscale = 4;
	sprleft = spr_oldmandialogue;
	sprright = spr_codadialogue;
	mydialoguespeakers = ["Coda", "Old man", "Coda", "Coda", "Old man", "Coda", "Old man", "Old man"];
	mydialoguetext = ["What's the big idea!?",	//0
						"Oh boy.",				//1
						"Oh boy is right!",		//2
						"And what the heck was that noise!?",	//3
						"*grumble*",	//4
						"Are you even listening?!", //5
						"Look kid, that wasn't just some noise!", //6
						"Let's just hope everyone else is okay."	//7
						];	
	myPortSeq = [1,2,1,1,2,1,2,2];
	active = true;
}


with (obj_player) {
	mystate = PLAYERSTATE.free;	
}

placeforDialogue = true;