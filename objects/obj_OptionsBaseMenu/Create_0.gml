event_inherited();
///Instantiate Variables

//Set up Menu array
menu = [];
menu[0] = [];
array_push(menu[0],
	{_enabled: true, _value: OPTIONS_CONTROLS, _label: "Controls"},
	{_enabled: true, _value: OPTIONS_GAMEPLAY, _label: "Gameplay"},
	{_enabled: false, _value: OPTIONS_VIDEO, _label: "Video"},
	{_enabled: true, _value: OPTIONS_SOUND, _label: "Sound"},
	{_enabled: true, _value: MENU_BACK, _label: "Back"}
);

function menuBack() {
	saveSettings();
	closeMenu();
}

function menuInteract() {
	switch(menu[0][mpos]._value){
		case OPTIONS_CONTROLS:
			instance_create_depth(CAMERA_WIDTH/2, CAMERA_HEIGHT/2, depth-1, obj_OptionsControlsMenu);
		    break;
		case OPTIONS_GAMEPLAY:
			instance_create_depth(CAMERA_WIDTH/2, CAMERA_HEIGHT/2, depth-1, obj_OptionsGameplayMenu);
		    break;
		case OPTIONS_VIDEO:
			//
		    break;
		case OPTIONS_SOUND:
			instance_create_depth(CAMERA_WIDTH/2, CAMERA_HEIGHT/2, depth-1, obj_OptionsSoundMenu);
		    break;
		case MENU_BACK:
		    menuBack();
		    break;
	}
}

calculateMenuBoundary();