var charspace = 24;
var strLen = string_length(currentstring);
if (strLen != 0) {
	for (var i = 0; i < strLen; ++i) {
		draw_sprite_ext(spr_number,real(string_char_at(currentstring, i)),currentx + (charspace*i),currenty,1,1,0,c_white,dmgAlpha);
	}
	
}
	
