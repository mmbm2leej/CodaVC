mySprite = spr_doorph;
myState = false;
completed = false;
receivedcompletion = false;
stayBlacktimermax = 120;
stayBlacktimer = stayBlacktimermax;
myAlpha = 0;

myWidth = display_get_gui_width()/(bbox_right - bbox_left);
myHeight = display_get_gui_height()/(bbox_bottom - bbox_top);