if(global.gamePaused) { image_speed = 0; exit; }

if(instance_exists(obj_PlayerPlatformer)){
	xTarget = obj_PlayerPlatformer.x;
	yTarget = obj_PlayerPlatformer.y;
	image_xscale = obj_PlayerPlatformer.image_xscale;
} else {
	instance_destroy();	
}

if(getInputUp()){
	yOffset = -8;
} else if(getInputDown()){
	yOffset = 8;
} else {
	yOffset = 0;	
}
x = xTarget;
y = yTarget + yOffset;