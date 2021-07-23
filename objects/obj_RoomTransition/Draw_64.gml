//Draw Fade
if(fadeType == FADE_CONSISTENT){
	draw_set_color(c_black);
	draw_set_alpha(fadeProgress);
	draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
} else if(fadeType == FADE_OUTWARD || fadeType == FADE_FROM_LEFT || fadeType == FADE_FROM_RIGHT) {
	draw_set_color(c_black);
	draw_set_alpha(1);
	draw_rectangle(x1, y1, x2, y2, 0);
}
draw_set_color(c_white);
draw_set_alpha(1);