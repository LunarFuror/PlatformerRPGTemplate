// Inherit the parent event
event_inherited();

isMoving = false;
tilemap = layer_tilemap_get_id("Terrain");
spawnTimer = floor(random_range(60,300));
horSpeedMax = 1;
vertSpeedMax = 1;

global.player.mapX = x;
global.player.mapY = y;

function createEnemies() {
	instance_create_depth(x+48, y, DEPTH_ENEMY, obj_EnemyTopGround);
	instance_create_depth(x-48, y, DEPTH_ENEMY, obj_EnemyTopGround);
	instance_create_depth(x, y+48, DEPTH_ENEMY, obj_EnemyTopGround);
	instance_create_depth(x, y-48, DEPTH_ENEMY, obj_EnemyTopGround);
	instance_create_depth(x+48, y, DEPTH_ENEMY-1, obj_Smoke);
	instance_create_depth(x-48, y, DEPTH_ENEMY-1, obj_Smoke);
	instance_create_depth(x, y+48, DEPTH_ENEMY-1, obj_Smoke);
	instance_create_depth(x, y-48, DEPTH_ENEMY-1, obj_Smoke);
}

function moveAndCollide() {
	//calculate speeds
	horSpeed = clamp(hMove * moveSpeed, horSpeedMax * -1, horSpeedMax);
	vertSpeed = clamp(vMove * moveSpeed, vertSpeedMax * -1, vertSpeedMax);
	
	roundVelocities();
	
	//move
	horMove(horSpeed, true);
	vertMove(vertSpeed);
}