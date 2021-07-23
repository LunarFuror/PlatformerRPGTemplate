event_inherited();

hasShot = true;
image_speed = 0;

function land(){
	makeJumpDust();
}

function shoot(){
	var dir = facingRight ? 1 : -1;
	instance_create_depth(x+(4*dir), y, depth-2, obj_SmokeSmall);
	var shot = instance_create_depth(x+(4*dir), y, depth-1, obj_Bullet);
	shot.attack = attack;
	shot.facingRight = facingRight;
	playEffect(snd_EnemyShoot);
	image_speed = 1
}

function jump(){
	var jumpHeight = round(random(2));
	vertSpeed = (jumpHeight+2)*-1;
	playEffect(snd_EnemyJump);
	makeJumpDust();
}

function groundedState(){
	if ( stateIsNew ) { 
		vertStop();
		stateIsNew = !stateIsNew;
	}

	// We're not on ground so let's change state to air
	if ( !onGround() ) {
		stateCurrent = MIDAIR_STATE;
		exit;
	}
}

function midairState() {
	if ( stateIsNew ) { stateIsNew = !stateIsNew }

	// We're on ground. Let's change the state to ground (unless we're going upwards)
	if (onGround() && vertSpeed >= 0) {
		stateCurrent = GROUNDED_STATE;
		land();
		exit;
	}
	// falling math and coyote
	vertSpeed = clamp(vertSpeed + grav + vertSpeedCarry, vertSpeedMax * -1, vertSpeedMax);
}

function moveAndCollide() {	
	horSpeedCarry = 0;	
	vertSpeedCarry = 0;
	//carry speed
	if(onPlatform()){
		var platform = instance_place(x, y + 1, obj_MovingPlatform);
		if(platform && (platform.state == 3 || platform.state == 2)){
			horSpeedCarry += platform.horSpeed;
		}
	}
	var horSpeedMaxFinal = horSpeedMax + abs(horSpeedCarry);

	// Calculate horSpeed
	if (hMove != 0 && iTime <= 0) { // trying to move
		horSpeed = clamp(horSpeed + (hMove * moveSpeed), horSpeedMaxFinal*-1, horSpeedMaxFinal);
	} else { // coming to a stop
		horSpeed = clamp(horSpeed - ((moveSpeed/1.5)*sign(horSpeed)), horSpeedMaxFinal*-1, horSpeedMaxFinal);
	}
	
	roundVelocities();
	
	var finalHorSpeed = round(clamp(horSpeed + (hMove * moveSpeed) + horSpeedCarry, horSpeedMaxFinal * -1, horSpeedMaxFinal));
	var finalVertSpeed = round(clamp(vertSpeed  + vertSpeedCarry, vertSpeedMax * -1, vertSpeedMax));
	
	//move
	var didHorMove = horMove(finalHorSpeed, true, true);
	vertMove(finalVertSpeed);
	if(!didHorMove){
		facingRight = !facingRight;
	}
}