//Things that shouldn't change
grav = GRAVITY;
iTimeMax = ENEMY_I_TIME;
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
animState = 0;
iTime = 0;
drop = -1;
carryFromHit = false;
dropWorth = 1;
stateIsNew = false;
stateCurrent = GROUNDED_STATE;
stateTimer = 0;

//safety variables
depth = DEPTH_ENEMY;
dropTable = [ {object: obj_MoneyPickup, worth: 5}, {object: obj_MoneyPickup, worth: 1} ];
facingRight = x < obj_PlayerParent.x;

function receiveForceV(val){
	horSpeed += val * -1;	
}

function receiveForceH(val){
	horSpeed = val;
}

function dropItem(){
	//drop table
	var dropRoll = irandom_range(0, 99);
	var droppedItem = -1;
	
	//if player is missing health and or mana, there's a chance the drop will be replaced with health or mana
	if((global.player.hp != global.player.hpMax  || global.player.mp != global.player.mpMax) 
	&& numBetween(dropRoll, 0, 23)){ //TODO: adjust for difficulty
		if(global.player.hp != global.player.hpMax && global.player.mp != global.player.mpMax){
			if(dropRoll%2==0){//TODO: maybe weight this based on which you need more.
				drop = obj_HealthPickup;	
				dropWorth = 1;
			} else {
				drop = obj_ManaPickup;	
				dropWorth = 1;
			}
		} else if(global.player.hp != global.player.hpMax){
			drop = obj_HealthPickup;	
			dropWorth = 1;
		} else {
			drop = obj_ManaPickup;	
			dropWorth = 1;
		}
	} else { // The actual drop table
		if(numBetween(dropRoll,0,9)){//10% - money 5
			droppedItem = dropTable[0];
		} else if(numBetween(dropRoll,10,60)) {//50% - money 1
			droppedItem = dropTable[1];
		}
		if(droppedItem != -1){
			drop = droppedItem.object;	
			dropWorth = droppedItem.worth;
		}
	}
}

function die(){
	dropItem();
	var deathObj = instance_create_depth(x, y, DEPTH_ENEMY, obj_EnemyDeath);
	deathObj.drop = drop;
	deathObj.dropWorth = dropWorth;
	var expObj = instance_create_depth(x, y, DEPTH_ENEMY+5, obj_ExpNumber);
	expObj.expValue = expWorth;
	changeXp(expWorth);
	instance_destroy();
}