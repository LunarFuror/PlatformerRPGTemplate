// You can write your code in this editor
function parallaxBackgrounds(){
	// Parallax stuff ===================================================================
	var _cam_x = camera_get_view_x(view_camera[0]);
	if(layer_exists("Background_Near")){
		layer_x("Background_Near", _cam_x * 0.5);
	}
	if(layer_exists("Background_Far")){
		layer_x("Background_Far", _cam_x * 0.85);
	}	
	if(layer_exists("Background_Distant")){
		layer_x("Background_Distant", _cam_x);
	}	
}

function platformerCameraMovement(){
	var upperBound = obj_PlayerPlatformer.y - 48;
	var lowerBound = obj_PlayerPlatformer.y + 48;
	var moveTarget = obj_PlayerPlatformer.x + clamp(obj_PlayerPlatformer.horSpeed*40, -96, 96);
	var lerpXAmount = .5;
	var lerpYAmount = .5;
	
	//X States ===================================================================
	if(obj_PlayerPlatformer.horSpeed != 0){
		xState = 2;
	} else {
		xState = 1;
	}
	
	switch(xState){
		case 0: break;
		case 1: targetX = obj_PlayerPlatformer.x;
			lerpXAmount = .05;
			break;
		case 2: 
			targetX = moveTarget; 
			lerpXAmount = .05;
			break;
	}
	
	//Y States ===================================================================
	if((getInputUp() || getInputDown()) 
		&& obj_PlayerPlatformer.horSpeed == 0
		&& obj_PlayerPlatformer.vertSpeed == 0){
		moveCameraTime = clamp(moveCameraTime-1, 0, CAMERA_PAN_TIME);	
	} else {
		moveCameraTime = CAMERA_PAN_TIME;		
	}
	
	if(moveCameraTime == 0){
		if(getInputUp()){
			yState = 3;
		} else {
			yState = 4;
		}
	} else if(obj_PlayerPlatformer.grounded){
		yState = 1;
	} else if (y > lowerBound || y < upperBound){
		yState = 2;
	} else {
		yState = 0;	
	}
	
	switch(yState){
		case 0: break;
		case 1: targetY = obj_PlayerPlatformer.y;
			lerpYAmount = .05;
			break;
		case 2: targetY = clamp(y,upperBound,lowerBound);
			lerpYAmount = .5;
			break;
		case 3: targetY = upperBound;
			lerpYAmount = .05;
			break;
		case 4: targetY = lowerBound;
			lerpYAmount = .05;
			break;
	}
	
	//Move ===================================================================
	x = lerp(x, targetX, lerpXAmount);
	y = lerp(y, targetY, lerpYAmount);
}