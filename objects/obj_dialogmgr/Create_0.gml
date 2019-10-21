#region Dialogue Strings

	#region All Cutscene Lines
		
		#region Intro Cutscene
		doOnce = false;
		IntroCutscene00_message = ["(Some hinted lore here in the form of a story told to Coda)",					//0
									"Alright Coda, you know the deal. Go get those pochumba roots for\ndinner!", 	//1
									"... Does that mean?!",															//2
									"Yup.",																			//3
									"Yes! Pochumbo tonight!",														//4
									"Get moving.",																	//5
									"Alright, alright! I'm going.",													//6
									"... Oh! And Coda... ",															//7
									"Yeah?",																		//8
									"DON'T go anywhere near that crazy old man near the cave out EAST.\nGot it?",	//9
									"I remember, mom. Geez."];														//10
		
		
		IntroCutscene00_speaker = ["Mom",	"Mom",	"Coda",	"Mom",	"Coda",	"Mom",	"Coda",	"Mom",	"Coda",	"Mom",	"Coda"];
								//	0		1		2		3		4		5		6		7		8		9		10
		IntroCutscene00_spkrSequence = [2,	2,		1,		2,		1,		2,		1,		2,		1,		2,		1];
		#endregion

		#endregion

	#region All NPC Lines

		#region Tess Act1
			Tess_act1_message = ["Whats up?",										//0
								"Umm, what was it that I was supposed to do?", 		//1
								"...",												//2
								"...",												//3
								"...",												//4
								"Coda I'm not your mommy.",							//5
								"That was definitely awkward."						//6
								];													
		
		
			Tess_act1_speaker = ["Tess",	"Coda",	"Tess",	"Coda",	"Tess",	"Tess",	"Coda"];
								//	0		1		2		3		4		5		6	
			Tess_act1_spkrSequence = [2,	1,		2,		1,		2,		2,		1];
		
		
		
		
		#endregion
		
	
	
	#endregion

#endregion

beginIntro = false;
playedIntro = false;
dialoguestate = false;

cs_sourcetype = "";
cs_source = noone;			//instance id of colliding npc object
cs_dialoguespeaker = noone;	//string of npc object name
cs_dialoguetext = noone;	//array of strings
cs_portSequence = noone;
cs_sprleft = noone;
cs_sprright = noone;



