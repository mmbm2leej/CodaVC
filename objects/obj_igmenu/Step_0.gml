#region if thisState is on

if (thisState) igalpha = approach(igalpha, 1, 0.1);
else {
	igalpha = approach(igalpha, 0, 0.1);
	button0alpha = approach(button0alpha, 0, 0.1);
	button1alpha = approach(button1alpha, 0, 0.1);
	button2alpha = approach(button2alpha, 0, 0.1);
}


#endregion

#region Each of the buttons

if (thisState) {


//Mouse variables for GUI
mx = window_mouse_get_x();
my = window_mouse_get_y();



//Might need to set up button objects 


	#region Continue Game Button
	
	//if hovering
	if (	(mx > (centerx - sprWidthHalf))		&&		(mx < (centerx + sprWidthHalf))		)
		&& (	(my > ((centery-140) - sprHeightHalf))		&&		(my < ((centery-140) + sprHeightHalf))	)	
	{
		button0alpha = approach(button0alpha, 1, 0.1);
		
		//if clicked
		if (mouse_check_button_pressed(mb_left)) {
				
			with (obj_gamemanager) {
				toggle_ig = true;	
			}
		}
		
		
	} else {
		button0alpha = approach(button0alpha, 0.7, 0.1);
	}
	
	

	#endregion


	#region Back to Main Menu Button
	//if hovering
	if (	(mx > (centerx - sprWidthHalf))		&&		(mx < (centerx + sprWidthHalf))		)
		&& (	(my > (centery - sprHeightHalf))		&&		(my < (centery + sprHeightHalf))	)
	{
		button1alpha = approach(button1alpha, 1, 0.1);
		
		//if clicked
		if (mouse_check_button_pressed(mb_left)) {
				
			//Transition to the main menu room
			room_goto(rm_mainmenu);
			//this is very crude, needs to be polished and fixed
		}


	} else {
		button1alpha = approach(button1alpha, 0.7, 0.1);
	}
	
	
	#endregion
	
	
	#region
	
	//if hovering
	if (	(mx > (centerx - sprWidthHalf))		&&		(mx < (centerx + sprWidthHalf))		)
		&& (	(my > ((centery+140) - sprHeightHalf))		&&		(my < ((centery+140) + sprHeightHalf))	)	
	{
		button2alpha = approach(button2alpha, 1, 0.1);
		
		//if clicked
		if (mouse_check_button_pressed(mb_left)) {
				
			game_end();
		}
		
	} else {
		button2alpha = approach(button2alpha, 0.7, 0.1);
	}
	
	

	#endregion





}

#endregion

#region Sizing

	myWidth = display_get_gui_width()/(bbox_right - bbox_left);
	myHeight = display_get_gui_height()/(bbox_bottom - bbox_top);
		
	centerx = display_get_gui_width()/2;
	centery = display_get_gui_height()/2;

#endregion