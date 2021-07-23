if(global.gamePaused) { image_speed = 0; exit; }

switch(state){
	case 0: //stopped right
		if(waitForPlayer){
			if(!place_meeting(x, y-1, obj_PlayerParent)){
				exit;
			}
		}
		stateTimer --;
		if(stateTimer <= 0){ 
			stateTimer = stateTimerMax;
			horSpeed = horSpeed * -1;
			state = 3; 
		}
		break;
	case 1: //stopped left
		if(waitForPlayer){
			if(!place_meeting(x, y-1, obj_PlayerParent)){
				exit;	
			}
		}
		stateTimer --;
		if(stateTimer <= 0){ 
			stateTimer = stateTimerMax;
			horSpeed = horSpeed * -1;
			state = 2; 
		}
		break;
	case 2: //moving right
		x += horSpeed;
		if(tile_meeting_precise(x + horSpeed, y, "Walls") || place_meeting(x + horSpeed, y, obj_Platform)){ state = 0; }
		if(state == 0){
			while (!tile_meeting_precise(x + sign(horSpeed), y, "Walls") && !place_meeting(x + sign(horSpeed), y, obj_Platform)){
				x += sign(horSpeed);
			}
		}
		break;
	case 3: //moving left
		x += horSpeed;
		if(tile_meeting_precise(x + horSpeed, y, "Walls") || place_meeting(x + horSpeed, y, obj_Platform)){ state = 1; }
		if(state == 1){
			while (!tile_meeting_precise(x + sign(horSpeed), y, "Walls") && !place_meeting(x + sign(horSpeed), y, obj_Platform)){
				x += sign(horSpeed);
			}
		}
		break;
}