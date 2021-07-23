//check for paused or cutscene
if(global.gamePaused) { image_speed = 0; exit; }
if(instance_exists(obj_RoomTransition)) { image_speed = 0; exit; }

//TIMERS =========================================================
if (lifeTime <= 0) {
	instance_destroy();	
} else {
	lifeTime --;
}

if (dirTime <= 0) {
	setRandomDirection();
} else {
	dirTime --;
}



//MOVEMENT =========================================================
// Calculate move speed
horSpeed = hMove*moveSpeed;
vertSpeed = vMove*moveSpeed;

//WALL COLLISIONS ========================================================= 
x += horSpeed;
y += vertSpeed;

//ANIMATIONS ========================================================= 
//calculate moving and direction
isMoving = abs(vertSpeed) > 0 || abs(horSpeed) > 0;

//enact moving and direction
if(isMoving){
	image_speed = 1;	
} else {
	image_speed = 0;
}

