if(isActive && !instance_exists(obj_RoomTransition)){
	if(instance_exists(obj_PlayerTopDown)){
		global.player.mapX = other.x;
		global.player.mapY = other.y;
	}
	transitionRoom(targetRoom, FADE_FAST,targetSound,fadeType, returnToMap, playerX, playerY, facingRight);
}