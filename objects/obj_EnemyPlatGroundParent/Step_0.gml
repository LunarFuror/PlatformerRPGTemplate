event_inherited();
//check for paused
if(global.gamePaused) { image_speed = 0; exit; }
if(instance_exists(obj_RoomTransition)) { image_speed = 0; exit; }

// ===== CALCULATE MOVEMENT =========================================================
// Calculate vertical speed
if(facingRight){
	hMove = 1;	
} else {
	hMove = -1;	
}

//MOVEMENT_STATE_MACHINE =========================================================
var _stateCurrent = stateCurrent;
switch(stateCurrent){
	case GROUNDED_STATE:
		groundedState();
		break;
	case MIDAIR_STATE:
		midairState();
		break;
}
stateIsNew = _stateCurrent != stateCurrent;
stateTimer = stateIsNew ? 0 : stateTimer + 1;
moveAndCollide();

// ===== ANIMATIONS ========================================================= 
if (iTime > 0) {
	image_alpha = .5;	
} else {
	image_alpha = 1;
}

//enact facing and state
if (facingRight){
	image_xscale = 1;	
} else {
	image_xscale = -1;	
}

//timers and effects
dustTime --;
if(dustTime <= 0 && abs(horSpeed) > horSpeedMax/2){
	dustTime = DUST_TIME_MAX;
	if(onGround()){
		makeWalkDust();
	}
}