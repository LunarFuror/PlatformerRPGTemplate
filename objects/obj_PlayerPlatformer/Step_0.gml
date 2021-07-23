//check for paused or cutscene
if(global.gamePaused) { image_speed = 0; exit; }
if(instance_exists(obj_RoomTransition)) { image_speed = 0; exit; }

//TIMERS =========================================================
if(iTime > 0) { iTime --; }

//INPUTS =========================================================
inLeft = getInputLeft();
inRight = getInputRight();
inDown = getInputDown();
inAttack = getInputFaceLeftPressed();
inJump = getInputFaceDownPressed();
inAbility = getInputFaceUpPressed();
inNextAbility = getInputShoulderR();
inPrevAbility = getInputShoulderL();

//CALCULATE INPUTS =========================================================
// Calculate variables needed later
hMove = inRight-inLeft;
grounded = onGround();
canStand = !tile_meeting_precise(x, y-8, "Walls");

//Check for attacking
if (inAttack){
	weaponAttack();
}

isAttacking = instance_exists(obj_PlayerWeaponAttackParent);

//check for ability use
if (inAbility){
	useAbility();
}

if(inNextAbility){
	nextAbility();	
}

if(inPrevAbility){
	prevAbility();	
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

//ANIMATIONS ========================================================= 
//calculate facing, alpha and state
if (hMove > 0) {
	facingRight = true;
} else if (hMove < 0) {
	facingRight = false;
}

if (iTime > 0) {
	image_alpha = .5;	
} else {
	image_alpha = 1;
}

if (grounded && abs(horSpeed) == 0) { //ground still
	if(isDucking){
		animState = 6;
	} else {
		animState = 0;
	}
} else if (grounded && abs(horSpeed) > 0) { //ground moving
	if(getInputDown()){
		animState = 7;
	} else {
		animState = 1;
	}
} else if (!grounded && abs(horSpeed) < .5 && vertSpeed < 0){ //jump still
	animState = 2;
} else if (!grounded && abs(horSpeed) >= .5 && vertSpeed < 0) { //jump moving
	animState = 3;
} else if (!grounded && abs(horSpeed) < .5 && vertSpeed >= 0){ //fall still
	animState = 4;
} else if (!grounded && abs(horSpeed) >= .5 && vertSpeed > 0) { //fall moving
	animState = 5;
}

//enact facing and state
if (facingRight){
	image_xscale = 1;	
} else {
	image_xscale = -1;
}

switch(animState){
	case 0: // ground still
		sprite_index = spr_PlayerPlatTempR;
		image_speed = 0;
		break;
	case 1: // ground moving
		sprite_index = spr_PlayerPlatTempR;
		image_speed = 1;
		break;
	case 2: // jump still
		sprite_index = spr_PlayerPlatTempJ;
		image_index = 0;
		image_speed = 0;
		break;
	case 3: // jump moving
		sprite_index = spr_PlayerPlatTempJ;
		image_index = 1;
		image_speed = 0;
		break;
	case 4: // fall still
		sprite_index = spr_PlayerPlatTempF;
		image_index = 0;
		image_speed = 0;
		break;
	case 5: // fall moving
		sprite_index = spr_PlayerPlatTempF;
		image_index = 1;
		image_speed = 0;
		break;
	case 6: // ground crouching
		sprite_index = spr_PlayerPlatTempC;
		image_speed = 0;
		break;
	case 7: // ground crouching moving
		sprite_index = spr_PlayerPlatTempC;
		image_speed = 1;
		break;
}

//timers and effects
dustTime --;
if(dustTime <= 0 && abs(horSpeed) > horSpeedMax/2){
	dustTime = DUST_TIME_MAX;
	if(grounded){
		makeWalkDust();
	}
}