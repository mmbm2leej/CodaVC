#region OLD CODE
/*

draw_set_alpha(hpbaralpha);

draw_sprite_stretched(spr_hpbarframe,0,guixpos,guiypos, basesize * healthbarsizemaxmult, 32);

#region Relating the GUI element to game state

// Making the bar proportional to the players remaining hp relative to max
draw_sprite_ext(spr_hpbar,0,guixpos,guiypos+16,healthbarsizemaxmult * (hpold/global.playermaxhp)/2, 0.5, 0, c_red, hpbaralpha);
//draw_sprite_stretched(spr_hpbar,0,guixpos,guiypos, basesize * healthbarsizemaxmult * (hpold/global.playermaxhp), 32);

draw_sprite_stretched(spr_hpbar,0,guixpos,guiypos, basesize * healthbarsizemaxmult * (hpnew/global.playermaxhp), 32);

#endregion

draw_set_alpha(1);

*/

#endregion

#region frames
var i;
for (i = 0; i < nodecount; ++i) {
	draw_sprite(spr_healthframe,0,guixpos + (i * basesize),guiypos);
}

#endregion


#region non-empty nodes

//full nodes
var j;
for (j = 0; j < fullnodes; ++j) {
	draw_sprite_ext(spr_healthnode,0,guixpos + (j * basesize),guiypos,1,1,0,c_white,1);
}

//the lead node

draw_circle_color(guixpos + ((leadnode)*basesize),guiypos,30*(visualleadnodehp/nodehealth),c_aqua,c_aqua,false);

#endregion


#region If in debug

if (obj_debug.debugmode) {
	draw_text_color(guixpos+((leadnode)*basesize),guiypos,leadnodehp,c_red,c_red,c_red,c_red,1);

}

#endregion