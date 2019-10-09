thisState = false;
igalpha = 0;
button0alpha = 0;
button1alpha = 0;
button2alpha = 0;

centerx = display_get_gui_width()/2;
centery = display_get_gui_height()/2;

myWidth = display_get_gui_width()/(bbox_right - bbox_left);
myHeight = display_get_gui_height()/(bbox_bottom - bbox_top);
sprWidthHalf = 100;	//These might have to change if the buttons are resized
sprHeightHalf = 34; //These might have to change if the buttons are resized

mySprite = spr_doorph;
blackx = camera_get_view_x(view_camera[0]);
blacky = camera_get_view_y(view_camera[0]);