//these don't need to be set by hand
horSpeed = 0;
horSpeedCarry = 0;
horSpeedFract = 0;
hMove = 0;
vertSpeed = 0;
vertSpeedMax = 8;
vertSpeedCarry = 0;
vertSpeedFract = 0;
vMove = 0;
coyote = 0;
coyoteMax = 6;
extraJumpsLeft = global.player.extraJumpsLeft;
extraJumpsMax = global.player.extraJumpsMax;
grav = GRAVITY;
animState = 0;
iTime = 0;
stateCurrent = GROUNDED_STATE;
stateIsNew = false;
stateTimer = 0;
_x = x;
_y = y;

//safety variables
depth = DEPTH_PLAYER;

jumpPower = global.player.jumpPower;
extraJumpsLeft = global.player.extraJumpsLeft;
extraJumpsMax = global.player.extraJumpsMax;

function receiveForceV(val){
	vertSpeed = val*-1;
}

function receiveForceH(val){
	horSpeed = val;
}

function receiveAdditiveForceV(val){
	vertSpeed += val*-1;
}

function receiveAdditiveForceH(val){
	horSpeed += val;
}

function setPosition(newX, newY, newFacingRight){
	x = newX;
	y = newY;
	horSpeed = 0;
	vertSpeed = 0;
	facingRight = newFacingRight;
}