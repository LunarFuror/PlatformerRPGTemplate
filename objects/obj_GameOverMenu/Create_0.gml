event_inherited();
///Instantiate Variables

//Set up Menu array
menu = [];
menu[0] = [];

menu[0][0] = {_enabled: true, _value: GAME_OVER_CONTINUE, _label: "Continue"};
menu[0][1] = {_enabled: true, _value: MENU_BACK, _label: "Quit"};

function menuBack() {
}

function menuInteract() {
	switch(menu[0][mpos]._value){
		case GAME_OVER_CONTINUE:
			loadGame(global.gameState.saveFileName);
			break;
	    case MENU_BACK:
			transitionRoom( ROOM_START, FADE_SLOW, mus_MainTheme, FADE_CONSISTENT, false, -1, -1, -1);
	        break;
	}
}

calculateMenuBoundary();