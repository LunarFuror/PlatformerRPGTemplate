//check for paused or cutscene
if(global.gamePaused) { image_speed = 0; exit; }
if(instance_exists(obj_RoomTransition)) { image_speed = 0; exit; }

//INPUTS =========================================================
//temporary inputs, move this to check global functions
inLeft = getInputLeft();
inRight = getInputRight();
inUp = getInputUp();
inDown = getInputDown();

// TODO: Remove me, I'm just for testing
if( getInputFaceUpPressed() ) {
	instance_create_depth(x, y, DEPTH_ENEMY, obj_EnemyTopGround);
}


//MOVEMENT =========================================================
// Calculate move speed

hMove = inRight-inLeft;
vMove = inDown-inUp;

moveAndCollide();

//ANIMATIONS ========================================================= 
//calculate moving and direction
isMoving = abs(vertSpeed) > 0 || abs(horSpeed) > 0;

if (horSpeed > 0) { //right
	animState = 1;
} else if (horSpeed < 0) { //left
	animState = 3;
} else if (vertSpeed < 0) { //up
	animState = 0;
} else if (vertSpeed > 0) { //down
	animState = 2;
} 

//enact moving and direction
if(isMoving){
	image_speed = 1;	
} else {
	image_speed = 0;
}

switch (animState){
	case 0: // up
		sprite_index = spr_PlayerTopTempU;
		break;
	case 1: // right
		sprite_index = spr_PlayerTopTempR;
		break;
	case 2: // down
		sprite_index = spr_PlayerTopTempD;
		break;
	case 3: // left
		sprite_index = spr_PlayerTopTempL;
		break;
	break;
}



// ENEMY SPAWNS ========================================================= 
currentBiome = floor(tilemap_get_at_pixel(tilemap, x, y)/16);

if((vertSpeed != 0 || horSpeed != 0)){
	switch(currentBiome){
		case ROAD: break;
		case GRASS: spawnTimer -= 1; break;
		case FOREST: spawnTimer -= 2; break;
		case SAND: spawnTimer -= 2; break;
		case WATER: spawnTimer -= .5; break;
		case SWAMP: spawnTimer -= 3; break;
		case MOUNTAIN: spawnTimer -= 3; break;
		case GRAVES: spawnTimer -= 3; break;
		case WASTELAND: spawnTimer -= 4; break;
		default: spawnTimer -= 1; break; // default to grass
	}
	if(instance_exists(obj_EnemyTopParent) && spawnTimer < 1){
		spawnTimer = 1;
	}
}

if(spawnTimer <= 0){
	createEnemies();
	spawnTimer = floor(random_range(450,600));
}