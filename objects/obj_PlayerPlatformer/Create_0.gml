event_inherited();

isDucking = false;
grounded = true;
canStand = true;
isAttacking = false;

//make sure the weapon exists
if(global.player.weapon != -1 && !instance_exists(obj_PlayerWeaponInnateParent)){
	switch (global.player.weapon){
		case KNIFE:
			instance_create_depth(x, y, DEPTH_WEAPON, obj_PlayerKnifeInnate);
			break;
		case SWORD:
			instance_create_depth(x, y, DEPTH_WEAPON, obj_PlayerSwordInnate);
			break;
	}
}

function takeDamage(damage){
	if(iTime <= 0){
		playEffect(snd_PlayerHurt);
		var incomingDamage = max(round(damage * global.player.defense), 1);
		changeHp(incomingDamage * -1);
	
		receiveForceV(2);
		if(other.x > x){
			receiveForceH(-1.5);
		} else {
			receiveForceH(1.5);
		}
	
		iTime = iTimeMax;
	}
}

function weaponAttack(){
	if( instance_exists(obj_PlayerWeaponInnateParent) && !isAttacking ){
		var newX = obj_PlayerWeaponInnateParent.x;
		var newY = obj_PlayerWeaponInnateParent.y;
		var oldYOffset = obj_PlayerWeaponInnateParent.yOffset;
		instance_destroy(obj_PlayerWeaponInnateParent);
		switch(global.player.weapon){
			case KNIFE:
				instance_create_depth(newX, newY, DEPTH_WEAPON, obj_PlayerKnifeAttack);
				playEffect(snd_KnifeAttack);
				break;
			case SWORD:
				instance_create_depth(newX, newY, DEPTH_WEAPON, obj_PlayerSwordAttack);
				playEffect(snd_KnifeAttack);
				break;
		}
		obj_PlayerWeaponAttackParent.yOffset = oldYOffset;
		obj_PlayerWeaponAttackParent.image_xscale = image_xscale;	
	}
}

function calculateAbilityCost(_baseCost){
	return min(round(_baseCost * global.player.magic), -1);	
}

function vineshroomAbility(){
	var _baseCost = -2.5;
	var _abilityCost = calculateAbilityCost(_baseCost);
	var _createX = x + (24 * image_xscale);
	var _canCreateShroom = true;
	
	var _vineshroom = instance_create_depth( _createX, y, DEPTH_OBJECT, obj_Vineshroom);
	with _vineshroom {
		if(tile_meeting_precise(x, y, "Walls") || !changeMp(_abilityCost)){
			_canCreateShroom = false;
		}
		instance_destroy();
	}
	
	if(_canCreateShroom){
		if (instance_exists(obj_Vineshroom)) {
			with obj_Vineshroom {
				instance_create_depth(x, y, depth-1, obj_Smoke);
				instance_destroy();
			}
		}
		instance_create_depth(_createX, y, DEPTH_OBJECT-1,obj_Smoke);
		instance_create_depth( _createX, y, DEPTH_OBJECT, obj_Vineshroom);
	}
}

function scootAbility(){
	// break blocks
}

function meatAbility(){
	// retrieve things
}

function chatAbility(){
	// ffx4 zero mushroom ability
}

function nextAbility(){
	
}

function prevAbility(){
	
}

function useAbility(){
	if( !isAttacking ){
		switch(global.player.ability){
			case VINESHROOM:
					vineshroomAbility();
				break;
			case SCOOT:
				var _baseCost = -5;
				var _abilityCost = calculateAbilityCost(_baseCost);
				if(changeMp(_abilityCost)){
					scootAbility();
				}
				break;
			case MEAT:
				var _baseCost = -5;
				var _abilityCost = calculateAbilityCost(_baseCost);
				if(changeMp(_abilityCost)){
					meatAbility();
				}
				break;
			case CHAT:
				var _baseCost = -10;
				var _abilityCost = calculateAbilityCost(_baseCost);
				if(changeMp(_abilityCost)){
					chatAbility();
				}
				break;
		}
	}
}

function jump(){
	vertSpeed = jumpPower*-1;
	coyote = 0;
	playEffect(snd_PlayerJump);
	makeJumpDust();
}

function land(){
	coyote = coyoteMax;
	extraJumpsLeft = extraJumpsMax;
	makeJumpDust();
}

function groundedState(){
	if ( stateIsNew ) { 
		vertStop();
		stateIsNew = !stateIsNew;
	}

	// We're not on ground so let's change state to air
	if ( !grounded ) {
		stateCurrent = MIDAIR_STATE;
		exit;
	}
	
	// If we intentionally jump, let's change state
	if ( inJump ) {
		if(inDown && !onFlatWall() && !onSlopedWall()){
			y++;
			stateCurrent = MIDAIR_STATE;
			exit; 
		} else if (canStand && (!isDucking || !isAttacking)) {
			jump();
			stateCurrent = MIDAIR_STATE;
			exit; 
		}
	}
	
	if( !isAttacking ){ //Make attacks matter		
		if(inDown){ //We can duck on the ground
			isDucking = true;
		} else if (canStand) { //We don't want to get stuck
			isDucking = false;
		}
	}
}

function midairState() {
	if ( stateIsNew ) { 
		isDucking = false;
		stateIsNew = !stateIsNew 
	}

	// We're on ground. Let's change the state to ground (unless we're going upwards)
	if (grounded && vertSpeed >= 0) {
		stateCurrent = GROUNDED_STATE;
		land();
		exit;
	}
	// falling math and coyote
	vertSpeed = clamp(vertSpeed + grav + vertSpeedCarry, vertSpeedMax * -1, vertSpeedMax);
	if (coyote > 0) {
		coyote -= 1;
	}
	
	// check if we can jump mid air
	if ( inJump && coyote > 0 ) {
		jump();
		exit; 
	}
	if ( inJump && extraJumpsLeft > 0 ) {
		extraJumpsLeft -= 1;
		jump();
		exit; 
	}
	
	// check for releasing jump
	if(getInputFaceDownReleased() && vertSpeed < 0){
		vertSpeed = vertSpeed/2;
	}
}

function moveAndCollide() {
	//check crouching
	if(isDucking){
		horSpeedMax = MAX_CROUCH_SPEED;	
	} else {
		horSpeedMax = MAX_WALK_SPEED;
	}
	
	//carry speed
	horSpeedCarry = 0;	
	vertSpeedCarry = 0;
	
	if(onPlatform()){
		var platform = instance_place(x, y + 1, obj_MovingPlatform);
		if(platform && (platform.state == 3 || platform.state == 2)){
			horSpeedCarry += platform.horSpeed;
		}
	}
	var horSpeedMaxFinal = horSpeedMax + abs(horSpeedCarry);

	//calculate speeds
	if (hMove != 0) {
		horSpeed = clamp(horSpeed + (hMove * moveSpeed), horSpeedMaxFinal * -1, horSpeedMaxFinal);
	} else {
		var slowDir = sign(horSpeed);
		horSpeed = clamp(horSpeed - ((moveSpeed / 1.5) * slowDir),  horSpeedMaxFinal * -1, horSpeedMaxFinal);
	}
	
	roundVelocities();
	
	var finalHorSpeed = round(clamp(horSpeed + (hMove * moveSpeed) + horSpeedCarry, horSpeedMaxFinal * -1, horSpeedMaxFinal));
	var finalVertSpeed = round(clamp(vertSpeed  + vertSpeedCarry, vertSpeedMax * -1, vertSpeedMax));
	
	//move
	horMove(finalHorSpeed, true);
	vertMove(finalVertSpeed);
}