drawFramedSimpleBox(style, x1, y1, x2, y2);
var _print = string_copy(content,1,textProgress);

setDrawText(font, fa_center, fa_top, c_black);
draw_text(((x1+x2)/2)+1, y1+PADDING+1, _print);

setDrawText(font, fa_center, fa_top, c_white);
draw_text((x1+x2)/2, y1+PADDING, _print);