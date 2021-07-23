// Need some good robust logic in here to determine which room to go to based on the enemy collided with
// and where we were when we collided with it
if(!instance_exists(obj_RoomTransition)){
	transitionRoom(other.targetRoom, .5, other.targetSound, other.playerX, other.playerY, other.facingRight);
}