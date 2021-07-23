//check for paused or cutscene
if(global.gamePaused) { image_speed = 0; exit; }
var _prevGrounded = onGround();

event_inherited();

if(_prevGrounded != onGround()){
	image_speed = 1;	
}