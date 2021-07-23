//TODO: Better Logic
if(instance_exists(obj_PlayerPlatformer)){
	if(global.gamePaused) exit;
	//platformerCameraMovement
	x = obj_PlayerPlatformer.x;
	y = obj_PlayerPlatformer.y;
} else if(instance_exists(obj_PlayerTopDown)){
	if(global.gamePaused) exit;
	x = obj_PlayerTopDown.x;
	y = obj_PlayerTopDown.y;
} else {
	x = 1;
	y = 1;
}
parallaxBackgrounds();