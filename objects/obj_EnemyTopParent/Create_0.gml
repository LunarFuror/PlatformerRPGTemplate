_x = x;
_y = y;
depth = DEPTH_ENEMY;

function setRandomDirection(){
	// trying to get time in seconds;
	dirTime = irandom_range(round(.25*game_get_speed(gamespeed_fps)), round(1*game_get_speed(gamespeed_fps)));
	switch(irandom_range(0,3)){
		case 0: hMove = 1;
				vMove = 0;
				break;
		case 1: hMove = -1;
				vMove = 0;
				break;
		case 2: hMove = 0;
				vMove = 1;
				break;
		case 3: hMove = 0;
				vMove = -1;
				break;
	}
}

setRandomDirection();