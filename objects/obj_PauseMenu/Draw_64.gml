draw_set_color(c_black);
draw_set_alpha(.5);
if(state == 0){
	var newAlpha = clamp(lerpProgress*2, 0, .5);
	draw_set_alpha(newAlpha);
}
if(state == 2){
	var newAlpha = clamp(.5-(lerpProgress*2), 0, .5);
	draw_set_alpha(newAlpha);
}
//this isn't getting drawn to the camera properly when we're snapping.
draw_rectangle(0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]), 0);
draw_set_color(c_white);
draw_set_alpha(1);

// Inherit the parent event
event_inherited();