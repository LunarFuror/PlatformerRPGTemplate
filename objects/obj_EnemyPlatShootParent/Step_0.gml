event_inherited();
//check for paused
if(global.gamePaused) { image_speed = 0; exit; }
if(instance_exists(obj_RoomTransition)) { image_speed = 0; exit; }

facingRight = x < obj_PlayerParent.x;

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
stateTimer ++;
if(stateTimer >= 90){
	jump();	
	hasShot = false;
	stateTimer = 0;
}
var oldY = y;
moveAndCollide();
if(oldY == y && hasShot == false){
	shoot();
	hasShot = true;
}

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