image_speed = 0;

function land(){
	makeJumpDust();
}

function groundedState(){
	if ( stateIsNew ) { 
		vertStop();
		land();
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
		exit;
	}
	// falling math and coyote
	vertSpeed = clamp(vertSpeed + grav + vertSpeedCarry, vertSpeedMax * -1, vertSpeedMax);
}

function moveAndCollide() {		
	//carry speed
	horSpeedCarry = 0;	
	vertSpeedCarry = 0;
	
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
	horMove(finalHorSpeed, true, true);
	vertMove(finalVertSpeed);
}