debugItems = [];
array_push(debugItems, {_label: "Paused", _value: string(global.gamePaused)});
if(instance_exists(obj_RoomTransition)){
	array_push(debugItems, {_label: "Fade Prog", _value: string(obj_RoomTransition.fadeProgress)});
	array_push(debugItems, {_label: "Fade Type", _value: string(obj_RoomTransition.fadeType)});
}
if(instance_exists(obj_PlayerTopDown)){
	var tileString = "";
	switch(obj_PlayerTopDown.currentBiome){
		case ROAD: tileString = "road"; break;
		case GRASS: tileString = "grass"; break;
		case FOREST: tileString = "forest"; break;
		case SAND: tileString = "sand"; break;
		case WATER: tileString = "water"; break;
		case SWAMP: tileString = "swamp"; break;
		case MOUNTAIN: tileString = "mountain"; break;
		case GRAVES: tileString = "grave"; break;
		case WASTELAND: tileString = "wasteland"; break;
	}
	array_push(debugItems, {_label: "Timer", _value: string(obj_PlayerTopDown.spawnTimer)});
	array_push(debugItems, {_label: "Tile", _value: tileString});
	array_push(debugItems, {_label: "Tile", _value: string(obj_PlayerTopDown.currentBiome)});
}
if(instance_exists(obj_PlayerPlatformer)){
	var ground = false;
	var goUp = false;
	var tile = 0;
	var tile2 = 0;
	with(obj_PlayerPlatformer){
		ground = onGround();
		goUp = canGoUp();
		tile = which_tile_meeting_precise_point(x, getBottomY()+1, "Walls");
		tile2 = which_tile_meeting_precise(x, y+1, "Walls");
	}
	array_push(debugItems, {_label: "coy: ", _value: string(obj_PlayerPlatformer.coyote)});
	array_push(debugItems, {_label: "gnd: ", _value: ground ? "true" : "false"});
	array_push(debugItems, {_label: "up:", _value: goUp ? "true" : "false"});
	array_push(debugItems, {_label: "tlp:", _value: string(tile)});
	array_push(debugItems, {_label: "tl2:", _value: string(tile2)});
	array_push(debugItems, {_label: "sta", _value: string(obj_PlayerPlatformer.stateCurrent)});
	array_push(debugItems, {_label: "vsp", _value: string(obj_PlayerPlatformer.vertSpeed)});
	array_push(debugItems, {_label: "hsp", _value: string(obj_PlayerPlatformer.horSpeed)});
}