jumping = false;
image_speed = 1;

#region Horizontal Movement(Free state)

var movedir = input_right - input_left;
hsp = movedir * movespd;
if ((!jumping) && (idletimer > 0)) switch abs(hsp) {
	case 0: sprite_index = spr_codaidle; break;	
	case walkspd: sprite_index = spr_codawalk; break;
	case runspd: sprite_index = spr_codarun;
	
	
}
	
	
if (hsp != 0) { 
	currentface = -1 * sign(hsp);
	image_xscale = currentface;
}


#region Horizontal Collision

if (place_meeting(x+hsp,y,obj_wallboundary)) {
	while (!place_meeting(x+sign(hsp),y,obj_wallboundary)) {
		x += sign(hsp);	
	}
	hsp = 0;		//this is causing sprite to collide with the floor
}



#endregion


#endregion

#region Gravity and Vertical Collision(below)

if (vsp <= 0) vsp += grav; else vsp += 2*grav;

if (place_meeting(x,y+vsp,obj_boundary)) {
	while (!place_meeting(x,y+sign(vsp),obj_boundary)) {
		y += sign(vsp);	
	}
	vsp = 0;		//this is causing sprite to collide with the floor
}


#endregion

#region Taking damage

if (keyboard_check_pressed(ord("O"))) {		//Simulate taking damage
	global.playercurrenthp -= 10;
	tookrecenthit = true;
	global.playerhpregentimer = global.playerhpregentimermax;
}

if (outofcombat) {
	outofcombattimer = outofcombattimermax;
	if (tookrecenthit) {
		global.playerhpregentimer--;
	
		if (global.playerhpregentimer < 0) {
			global.playercurrenthp = approach(global.playercurrenthp,global.playermaxhp,global.playerhpregen);
		
			if (global.playercurrenthp == global.playermaxhp) {
				tookrecenthit = false;	
			
			}
		}
	}
	
} else {	//if !outofcombat
	outofcombattimer--;
	if (outofcombattimer <= 0) {
		outofcombat = true;
	}

}


#endregion

#region Transitioning rooms

if (place_meeting(x,y, obj_transitionboundary)) {
	var partner = (instance_place(x,y,obj_transitionboundary));
	with (obj_roomsequence) {
		if (!doTransition) {
			targetRoom = partner.mytargetroom;
			targetx = partner.mytargetx;
			targety = partner.mytargety;
			doTransition = true;
		}
	}
	
}


#endregion

#region Toggling
//Toggling run and walk
if (toggle_runwalk) {
	if (movespd == walkspd) movespd = runspd; else movespd = walkspd;
}
#endregion

#region Attack State Transition
if (input_melee) mystate = PLAYERSTATE.melee;
else if (input_shoot) mystate = PLAYERSTATE.ranged;
	
#endregion

#region Long idle


if (idletimer > 0) idletimer--;
if (input_right || input_jump || toggle_runwalk || input_shoot || input_melee || input_interact) 
	idletimer = idletimermax;
		

if (idletimer <= 0) {
	mystate = PLAYERSTATE.longidle;
} 



#endregion

#region Jumping

if ((input_jump) && (place_meeting(x,y+1,obj_boundary))) {
	mystate = PLAYERSTATE.jumprise;
}

#endregion

#region Speaking to an NPC or Touching a cutscene boundary/QuestItem

if (input_interact && (place_meeting(x,y,obj_npc))) {
	var dialoguepartner = instance_place(x,y,obj_npc);
	var partnername = dialoguepartner.myname;
	with (dialoguepartner) mystate = NPCSTATES.speaking;
	with (obj_dialogmgr) {
		cs_source = dialoguepartner;
		cs_dialoguespeaker = partnername;
		cs_dialoguetext = dialoguepartner.mylines;
		cs_spkrSprite = dialoguepartner.mydialoguesprite;
		dialoguestate = true;
	}
	mystate = PLAYERSTATE.speaking;

}

if (place_meeting(x,y,obj_cutscenehitbox)) {
	var hb = instance_place(x,y,obj_cutscenehitbox);
	var portseq = hb.myPortSeq;
	if (!hb.watched) {
		with (obj_dialogmgr) {
			cs_sourcetype = "Cutscene";
			cs_source = hb;
			cs_dialoguespeaker = hb.mydialoguespeakers;
			cs_dialoguetext = hb.mydialoguetext;
			cs_portSequence = portseq;
			cs_spkrSprite = noone;
			dialoguestate = true;
		}
		mystate = PLAYERSTATE.speaking;
	}
	
}

if (place_meeting(x,y,obj_questitem)) {
	var qI = instance_place(x,y,obj_questitem);
	with (obj_dialogmgr) {
		cs_source = qI;
		cs_dialoguespeaker = "QuestItem";
		cs_dialoguetext = qI.mydialoguetext;
		cs_spkrSprite = noone;
		dialoguestate = true;
	}
	mystate = PLAYERSTATE.speaking;
	
}


#endregion




