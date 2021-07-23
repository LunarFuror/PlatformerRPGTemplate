for(i = 0; i < array_length(debugItems); i++){
	setDrawText(fnt_Menu,fa_left,fa_middle,c_black);
	draw_text(x+4+1, y+8*i+1, debugItems[i]._label + ": " + debugItems[i]._value);
	setDrawText(fnt_Menu,fa_left,fa_middle,c_white);
	draw_text(x+4, y+8*i, debugItems[i]._label + ": " + debugItems[i]._value);
}