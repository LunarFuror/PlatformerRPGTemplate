vertSpeed = 0;
vertSpeedMax = 8;
vertSpeedCarry = 0;
vertSpeedFract = 0;
vMove = 0;
horSpeed = 0;
horSpeedCarry = 0;
horSpeedMaxInitial = horSpeedMax;
horSpeedFract = 0;
hMove = 0;
stateIsNew = false;
stateCurrent = MIDAIR_STATE;

//safety variables
depth = DEPTH_ENEMY;
facingRight = x < obj_PlayerParent.x;