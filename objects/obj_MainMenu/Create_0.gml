event_inherited();
///Instantiate Variables

//Set up Menu arrays
//Main Menu
menu = [];
menu[0] = [];
array_push(menu[0],
	{_enabled: true, _value: MAIN_START, _label: "Start Game"},
	{_enabled: true, _value: MAIN_OPTIONS, _label: "Options"},
	{_enabled: true, _value: MENU_BACK, _label: "Quit"}
);

function menuBack() {
	redState = false;
	mpos = 2;
}

function menuInteract() {
	switch(menu[0][mpos]._value){
		case MAIN_START:
			instance_create_depth(CAMERA_WIDTH/2, CAMERA_HEIGHT/2, depth-1, obj_StartGameMenu);
		    break;
		case MAIN_OPTIONS:
			instance_create_depth(CAMERA_WIDTH/2, CAMERA_HEIGHT/2, depth-1, obj_OptionsBaseMenu);
		    break;
		case MENU_BACK:
			if(redState){
				game_end();
			} else {
				redState = true;
			}
		    break;
	}
}

calculateMenuBoundary();