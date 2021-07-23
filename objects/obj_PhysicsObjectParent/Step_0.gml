//check for paused or cutscene
if(global.gamePaused) { image_speed = 0; exit; }

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