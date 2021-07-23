drawFramedSimpleBox(style, x1, y1, x2, y2);

if (state == 1) {
	var cursorSprite = spr_MainMenuCursor;
	if(fadeIn < 1){ 
		fadeIn += .1; 
	}
	draw_set_alpha(fadeIn);
	
	var cursorX = x1 + PADDING
	var cursorY = y1 + mpos*(font_get_size(font)) + (PADDING * 1.4);
	
	//Draw the text
	for (var m = 0; m < array_length(menu[currentMenu]); m++){
		var textX = cursorX + font_get_size(font) + sprite_get_width(cursorSprite);
		var textY = y1 + (m * (font_get_size(font))) + (PADDING * 1.4);
	
		setDrawText(font, fa_left, fa_middle, c_black);
		draw_text(textX + 1, textY + 1, string(menu[currentMenu][m]._label));
		
		if (!menu[currentMenu][m]._enabled) {
				setDrawText(font, fa_left, fa_middle, c_grey);
		} else if(m == mpos) {
			if (redState) {
				setDrawText(font, fa_left, fa_middle, c_red);
			} else if (greenState) {
				setDrawText(font, fa_left, fa_middle, c_green);
			} else {
				setDrawText(font, fa_left, fa_middle, c_aqua);
			}
		} else {
			setDrawText(font, fa_left, fa_middle, c_white);
		}
		draw_text(textX , textY, string(menu[currentMenu][m]._label));
	}
	
	//Draw the cursor
	if(redState){
		draw_sprite_ext(cursorSprite, 0, cursorX, cursorY, 1, 1, 0, c_red, 1);
	} else if (greenState){
		draw_sprite_ext(cursorSprite, 0, cursorX, cursorY, 1, 1, 0, c_lime, 1);
	} else {
		draw_sprite(cursorSprite, 0, cursorX, cursorY);
	}
	
	//fade menu
	if(id != global.activeMenu || instance_exists(obj_TextBox)){
		draw_set_color(c_black);
		draw_set_alpha(.75);
		draw_rectangle(x1, y1, x2, y2, 0);	
	}
}
draw_set_alpha(1);