/// @description Insert description here
var bottom = display_get_gui_height();

if (	(room != room0)		&&		(room != rm_mainmenu)	) {
	if (instance_exists(obj_globalvarbank)) {
		if (global.playable) {
			draw_sprite_ext(spr_glovegui,0,0,bottom,1,1,currentangle,c_white,alpha);
		}
	}
}