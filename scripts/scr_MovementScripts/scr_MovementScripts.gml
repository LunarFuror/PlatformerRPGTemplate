function onGround(){
	var isOnGround = false;
	isOnGround = onFlatWall() || onSlopedWall() || onPlatform();
	return isOnGround;
}

function onFlatWall() {
	var isOnFlatWall = false;
	var currentTile = which_tile_meeting_precise(x, y+1, "Walls");
	if( currentTile == FLAT_WALL_INDEX ) { var isOnFlatWall = true; }
	var currentTilePoint = which_tile_meeting_precise_point(x, getBottomY()+1, "Walls");
	if( currentTilePoint == FLAT_WALL_INDEX ) { var isOnFlatWall = true; }
	return isOnFlatWall;
}

function onSlopedWall() {
	var isOnSlopedWall = false;
	//our sprites are image index middle center and we want the point just under the center of the sprite
	var currentTile = which_tile_meeting_precise_point(x, getBottomY()+1, "Walls");
	if( currentTile >= FIRST_SLOPE_INDEX ) { var isOnSlopedWall = true; }
	return isOnSlopedWall;
}

function onPlatform() {
	var isOnPlatform = collision_rectangle(bbox_left, bbox_bottom + 1, bbox_right, bbox_bottom + 1, obj_Platform, false, true);

	if ( !isOnPlatform ) {
		return noone;
	}
	
	var inside_platform = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_Platform, false, true);

	if ( !inside_platform ) {
		return isOnPlatform;
	}

	if ( isOnPlatform == inside_platform ) {
		return noone;
	}
	
	return isOnPlatform;
}

function canGoUp(){
	return !tile_meeting_top(x, 1, "Walls");
}

function getBottomY(){ // gets the bottom y value, within the sprite
	return y + (sprite_height/2) - 1;
}

function horStop(){
	horSpeed = 0;
	horSpeedFract = 0;
}

function vertStop(){
	vertSpeed = 0;
	vertSpeedFract	= 0;
}

function roundVelocities() {
	horSpeedFract += horSpeed;
	horSpeed = round(horSpeedFract);
	horSpeedFract -= horSpeed;

	vertSpeedFract += vertSpeed;
	vertSpeed = round(vertSpeedFract);
	vertSpeedFract -= vertSpeed;
}

function horMove(_horSpeed, _doSlope) {
	var _collideTransition = argument_count > 2 ? argument[2] : false;
	
	// Movement/Collision X
	var _horDir = sign(_horSpeed);
	var didMove = true;

	repeat(abs(_horSpeed)) {
		var wallCheck = which_tile_meeting_precise(x + _horDir, y, "Walls");
		var transitionCheck = place_meeting(x + _horDir, y, obj_TransitionTrigger) && _collideTransition;
		if ( wallCheck != FLAT_WALL_INDEX && !transitionCheck ) { // not running into a flat wall
			x += _horDir;
			
			// Inside a slope (must go up)
			var i = 0;
			while ( which_tile_meeting_precise_point(x, getBottomY(), "Walls") >= FIRST_SLOPE_INDEX && i < abs(_horSpeed) ) { // running into slope
				if ( _doSlope && canGoUp()) {
					y--;
					i++
				} else {
					// Let's go back (outside slope) and stop
					x -= _horDir;
					horStop();
					didMove = false;
					break;
				}
			}
			if( which_tile_meeting_precise_point(x, getBottomY(), "Walls") >= FIRST_SLOPE_INDEX ) {
				y += i;
				x -= _horDir;
				didMove = false;
			}
		
			// On a slope going down
			while ( _doSlope && !onGround() && which_tile_meeting_precise_point(x, getBottomY() + 2, "Walls") >= FIRST_SLOPE_INDEX ) {
				y++;
			}
		} else { // running into a flat wall
			horStop();
			didMove = false;
			break;
		}
	}
	return didMove;
}

function vertMove(_vertSpeed) {
	// Movement/Collision Y
	var _vertDir = sign(_vertSpeed);
	var didMove = true;

	repeat(abs(_vertSpeed)) {
		// Going down
		if (_vertDir > 0) {
			if ( !onGround() ) {
				y += _vertDir;
			} else {
				vertStop();
				didMove = false;
				break;
			}
		} else { // Going up
			if ( canGoUp() && !tile_meeting_top(x, 0, "Walls") ) {
				y += _vertDir;
			} else {
				vertStop();
				didMove = false;
				break;
			}
		}
	}	
}