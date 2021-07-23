// Need some good robust logic in here to determine which room to go to based on the enemy collided with
// and where we were when we collided with it
global.player.mapX = x;
global.player.mapY = y;

switch(currentBiome){
	case ROAD: 
		transitionRoom(rm_TestingRoad, FADE_FAST, mus_Temple, FADE_OUTWARD, false, -1, -1, true);
		break;
	case GRASS: 
		transitionRoom(rm_TestingGrass, FADE_FAST, mus_Grass, FADE_OUTWARD, false, -1, -1, true);
		break;
	case FOREST: 
		transitionRoom(rm_TestingForest, FADE_FAST, mus_Forest, FADE_OUTWARD, false, -1, -1, true);
		break;
	case SAND: 
		transitionRoom(rm_TestingSand, FADE_FAST, mus_Sand, FADE_OUTWARD, false, -1, -1, true);
		break;
	case WATER: 
		transitionRoom(rm_TestingWater, FADE_FAST, mus_Water, FADE_OUTWARD, false, -1, -1, true);
		break;
	case SWAMP: 
		transitionRoom(rm_TestingSwamp, FADE_FAST, mus_Swamp, FADE_OUTWARD, false, -1, -1, true);
		break;
	case MOUNTAIN: 
		transitionRoom(rm_TestingMountain, FADE_FAST, mus_Mountain, FADE_OUTWARD, false, -1, -1, true);
		break;
	case GRAVES: 
		transitionRoom(rm_TestingGrave, FADE_FAST, mus_Graves, FADE_OUTWARD, false, -1, -1, true);
		break;
	case WASTELAND: 
		transitionRoom(rm_TestingWasteland, FADE_FAST, mus_Wasteland, FADE_OUTWARD, false, -1, -1, true);
		break;
	default: 
		transitionRoom(rm_TestingRoad, FADE_FAST, mus_Temple, FADE_OUTWARD, false, -1, -1, true);
		break;
}	


instance_destroy(obj_EnemyTopParent);