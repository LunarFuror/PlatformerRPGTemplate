event_inherited();

if(global.gamePaused) { image_speed = 0; exit; }
if(instance_exists(obj_RoomTransition)) { image_speed = 0; exit; }
// ===== CALCULATE MOVEMENT =========================================================
// Calculate vertical speed
stateTimer --;
if(stateTimer <= 0){
	if(!doesNotMove && isWaiting){
		facingRight = round(random(.99));
		stateTimer = floor(random(60)+60);
	} else {
		stateTimer = floor(random(180)+60);
	}
	isWaiting = !isWaiting;
}

if(doesNotMove || isWaiting) {
	hMove = 0;
} else {
	if(facingRight){
		hMove = 1;	
	} else {
		hMove = -1;	
	}
}

//MOVEMENT_STATE_MACHINE =========================================================
var _stateCurrent = stateCurrent;

switch( stateCurrent ) {
	case GROUNDED_STATE:
		groundedState();
		break;
	case MIDAIR_STATE:
		midairState();
		break;
}
stateIsNew = _stateCurrent != stateCurrent;
moveAndCollide();

// ===== ANIMATIONS ========================================================= 

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