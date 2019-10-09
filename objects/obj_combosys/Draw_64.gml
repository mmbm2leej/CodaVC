/// @description Draw Combo Counter

if (combocurrent > 0) {
	draw_set_font(fnt_combo);
	draw_set_color(c_fuchsia);
	//draw_text(combo_x,combo_y,combocurrent);
	
	//if the combo is triple digit
	if (combocurrent > 99) {
		
		
	
	
	
	}
	
	//if the combo is double digit
	if (combocurrent > 9) { 
		
		
		
		
		
	}	
	
	//if the combo is single digit
	else { 
		printnumber(combocurrent, 0);

	}

	draw_set_font(fnt_default);
	draw_set_color(c_black);
}
