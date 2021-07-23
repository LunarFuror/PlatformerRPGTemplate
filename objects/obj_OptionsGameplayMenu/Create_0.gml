event_inherited();
///Instantiate Variables
storeJoypadChoice = global.usingJoypad;

//Set up Menu array
menu = [];
menu[0] = [];

if(global.usingJoypad){
    menu[0][0] = {_enabled: true, _value: CONTROLS_GAMEPAD, _label: "Gamepad - ON"};
}
else{
	menu[0][0] = {_enabled: true, _value: CONTROLS_GAMEPAD, _label: "Gamepad - OFF"};
} 
menu[0][1] = {_enabled: true, _value: CONTROLS_ACCEPT, _label: "Accept"};
menu[0][2] = {_enabled: true, _value: MENU_BACK, _label: "Back"};

//hackery for menu size purposes
holdingMenu0 = menu[0][0];
menu[0][0] = {_enabled: true, _value: CONTROLS_GAMEPAD, _label: "Gamepad - *OFF"};
calculateMenuBoundary();
menu[0][0] = holdingMenu0;

function menuBack() {
	closeMenu();
}

function menuInteract() {
	switch(menu[0][mpos]._value){
	    case CONTROLS_GAMEPAD:
			//this needs to check if there's a gamepad to even allow switching
	        storeJoypadChoice = !storeJoypadChoice;
			if(storeJoypadChoice){
				menu[0][0]._label = "Gamepad - *ON";
			} else {
				menu[0][0]._label = "Gamepad - *OFF";
			}
	        break;
	    case CONTROLS_ACCEPT:
	        global.usingJoypad = storeJoypadChoice;
			menuBack();
	        break;
		case MENU_BACK:
			menuBack();
			break;
	}
}