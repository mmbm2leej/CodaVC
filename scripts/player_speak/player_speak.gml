/*
When the dialogue is happening and two or more NPCs collide with the 
player object, there is confliction where sometimes non-intiating NPCs will interrupt
or take over the dialogue sequence.

*/


hsp = 0;
sprite_index = spr_codaidle;
var hb = instance_place(x,y,obj_cutscenehitbox);
if (hb.watched) mystate = PLAYERSTATE.free;
/*
var dialoguepartner = instance_place(x,y,obj_npc);
var partnername = dialoguepartner.myname;
with (dialoguepartner) mystate = NPCSTATES.speaking;


with (obj_dialogmanager) {
	partnerid = dialoguepartner;
	playerpartner = partnername;
	if (!dialoguecomplete) dialoguestatus = true;
}

*/

/*
if (obj_dialogmgr.dialoguecomplete) {
	with (obj_dialogmanager) dialoguestatus = false;
	with (dialoguepartner) mystate = NPCSTATES.idle;
	mystate = PLAYERSTATE.free;
}
*/
