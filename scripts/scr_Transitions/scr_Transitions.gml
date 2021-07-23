// Use -1 for anything being ignored.
function transitionRoom(targetRoom, fadeSpeed, targetMusic, thisFadeType, returnToMap, playerX, playerY, playerFacingRight){
	//returnToMap overrides player position
	var newPlayerX = returnToMap ? global.player.mapX : playerX;
	var newPlayerY = returnToMap ? global.player.mapY : playerY;
	
	var transition = instance_create_depth(0,0,DEPTH_TRANSITION,obj_RoomTransition);
	transition.tempTargetRoom = targetRoom;
	transition.fadeSpeed = fadeSpeed;
	transition.targetMusic = targetMusic;
	transition.tempTargetX = newPlayerX;
	transition.tempTargetY = newPlayerY;
	transition.tempFacingRight = playerFacingRight;
	transition.fadeType = thisFadeType;
}