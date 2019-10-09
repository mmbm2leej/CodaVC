left = 64;
bot = 420;

draw_set_alpha(fade);

draw_text_ext_transformed_color(left,bot,global.playercurrentlevel,0,40,2,2,0,c_black,c_black,c_black,c_black,fade);

#region XP Bar

draw_sprite_stretched_ext(spr_hpbarframe,0,guixpos,guiypos, basesize * xpbarsizemaxmult, 16, c_white, fade);


draw_sprite_stretched_ext(spr_xpbar,0,guixpos,guiypos, basesize * xpbarsizemaxmult * (xpnew/global.playernextlevelxp), 16, c_white, fade);



#endregion

if (levelup) {
	draw_sprite_ext(spr_levelupnotice,0,480,270,1,1,0,c_white,alpha);
}

draw_set_alpha(1);