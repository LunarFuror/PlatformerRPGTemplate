//convert fade from seconds to percentage
if(fadeDelay <= 0){
	fadeSpeedPercent = 1/(game_get_speed(gamespeed_fps)*(fadeSpeed/2));
	var fadeDir = fadeState == FADE_IN ? 1 : -1;
	fadeProgress = clamp(fadeProgress + (fadeDir * fadeSpeedPercent), 0, 1);
} else {
	fadeDelay --;
	exit;
}

//fully faded in, switch room, start fading out
if(fadeState == FADE_IN && fadeProgress == 1){
    room_goto(tempTargetRoom);
	global.gameState.roomSound = targetMusic;
    fadeState = FADE_OUT;
	if(fadeType == FADE_OUTWARD || fadeType == FADE_FROM_LEFT || fadeType == FADE_FROM_RIGHT){
		fadeDelay = 15;
	}
}

//fading out
if(fadeState == FADE_OUT){
	if(room == tempTargetRoom && !playerMoved && instance_exists(obj_PlayerParent)){
		if( tempTargetX != -1 && tempTargetY != -1 ) {
			obj_PlayerParent.setPosition(tempTargetX, tempTargetY, tempFacingRight);
		}
		if (tempFacingRight != -1) {
			obj_PlayerParent.facingRight = tempFacingRight;
			obj_PlayerParent.image_xscale = tempFacingRight ? 1 : -1;
		}
		playerMoved = true;
	}
	
	if(global.gamePaused == true){
		global.gamePaused = false;	
	}
}

if(fadeProgress == 0 && fadeState == FADE_OUT){ //fully faded out
    instance_destroy();
}

if(fadeType == FADE_OUTWARD) {
	var centerX = camera_get_view_width(view_camera[0])/2;
	var centerY = camera_get_view_height(view_camera[0])/2;
	var targetX1 = 0;
	var targetY1 = 0;
	var targetX2 = camera_get_view_width(view_camera[0]);
	var targetY2 = camera_get_view_height(view_camera[0]);
	
	x1 = lerp(centerX, targetX1, fadeProgress);
	y1 = lerp(centerY, targetY1, fadeProgress);
	x2 = lerp(centerX, targetX2, fadeProgress);
	y2 = lerp(centerY, targetY2, fadeProgress);
} else if(fadeType == FADE_FROM_RIGHT) {
	var targetX1 = 0;
	
	x1 = lerp(camera_get_view_width(view_camera[0]), targetX1, fadeProgress);
	y1 = 0;
	x2 = camera_get_view_width(view_camera[0]);
	y2 = camera_get_view_height(view_camera[0]);
} else if(fadeType == FADE_FROM_LEFT) {
	var targetX2 = camera_get_view_width(view_camera[0]);
	
	x1 = 0
	y1 = 0;
	x2 = lerp(0, targetX2, fadeProgress);
	y2 = camera_get_view_height(view_camera[0]);
}