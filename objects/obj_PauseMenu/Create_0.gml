event_inherited();
///Instantiate Variables
global.gamePaused = true;

var canSave = (room == OVERWORLD_ROOM);

// Set up Menu array
menu = [];
menu[0] = [];
array_push(menu[0], {_enabled: false, _value: PAUSE_INVENTORY, _label: "Inventory"});
array_push(menu[0], {_enabled: true, _value: PAUSE_STATS, _label: "Stats"});
array_push(menu[0], {_enabled: true, _value: PAUSE_LEVEL_UP, _label: "Level Up"});
array_push(menu[0], {_enabled: canSave, _value: PAUSE_SAVE, _label: "Save"});
array_push(menu[0], {_enabled: true, _value: PAUSE_QUIT, _label: "Quit to title"});
array_push(menu[0], {_enabled: true, _value: MENU_BACK, _label: "Close menu"});

function menuBack() {
	if(redState){
		redState = false;
	} else {
		closeMenu(true);
	}
}

function menuInteract() {
	switch(menu[0][mpos]._value){
	    case PAUSE_INVENTORY:
	        break;
	    case PAUSE_STATS:
			var outputString = "HP:" + string(global.player.hp) + "/" + string(global.player.hpMax);
			outputString += "  MP:" + string(global.player.mp) + "/" + string(global.player.mpMax);
			outputString += "\nAttack:" + string(global.player.attackLevel+1);
			outputString += "  Defense:" + string(global.player.defenseLevel+1);
			outputString += "  Magic:" + string(global.player.magicLevel+1);
			newTextBox(outputString, 3, fnt_Message);
	        break;
	    case PAUSE_LEVEL_UP:
			instance_create_depth(CAMERA_WIDTH/2, CAMERA_HEIGHT/2, depth-1, obj_LevelUpMenu);
	        break;
	    case PAUSE_SAVE:
			saveGame(global.gameState.saveFileName);
			newTextBox("\n Game Saved!", 3, fnt_Message);
	        break;
		case PAUSE_QUIT:
			if(!redState){
				redState = true;	
			} else {
				transitionRoom( ROOM_START, FADE_SLOW, mus_MainTheme, FADE_CONSISTENT, false, -1, -1, -1);
			}
			break;
	    case MENU_BACK:
			menuBack();
	        break;
	}
}

calculateMenuBoundary();