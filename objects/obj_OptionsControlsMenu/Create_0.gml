event_inherited();
///Instantiate Variables
storeJoypadChoice = global.usingJoypad;
isWaiting = false;
isClear = false;
holdingButtons = [];

if(!global.usingJoypad){
    holdingButtons[0] = global.keyboard_up;
    holdingButtons[1] = global.keyboard_down;
    holdingButtons[2] = global.keyboard_left;
    holdingButtons[3] = global.keyboard_right;
    holdingButtons[4] = global.keyboard_face_d;
    holdingButtons[5] = global.keyboard_face_l;
    holdingButtons[6] = global.keyboard_face_r;
    holdingButtons[7] = global.keyboard_face_u;
    holdingButtons[8] = global.keyboard_shoulder_l;
    holdingButtons[9] = global.keyboard_shoulder_r;
    holdingButtons[10] = global.keyboard_start;
    holdingButtons[11] = global.keyboard_select;
}
else{
    holdingButtons[0] = global.joypad_up;
    holdingButtons[1] = global.joypad_down;
    holdingButtons[2] = global.joypad_left;
    holdingButtons[3] = global.joypad_right;
    holdingButtons[4] = global.joypad_face_d;
    holdingButtons[5] = global.joypad_face_l;
    holdingButtons[6] = global.joypad_face_r;
    holdingButtons[7] = global.joypad_face_u;
    holdingButtons[8] = global.joypad_shoulder_l;
    holdingButtons[9] = global.joypad_shoulder_r;
    holdingButtons[10] = global.joypad_start;
    holdingButtons[11] = global.joypad_select;
}

//Set up Menu array
menu[0][12] = {_enabled: true, _value: CONTROLLS_ACCEPT, _label: "Accept"};
menu[0][13] = {_enabled: true, _value: MENU_BACK, _label: "Back"};

function setupControls(){
	if(!global.usingJoypad){
	    menu[0][0]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Up            - " + getButtonString(global.keyboard_up)}; 
	    menu[0][1]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Down          - " + getButtonString(global.keyboard_down)}; 
	    menu[0][2]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Left          - " + getButtonString(global.keyboard_left)}; 
	    menu[0][3]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Right         - " + getButtonString(global.keyboard_right)}; 
	    menu[0][4]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Jump / Accept - " + getButtonString(global.keyboard_face_d)}; 
	    menu[0][5]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Attack        - " + getButtonString(global.keyboard_face_l)}; 
	    menu[0][6]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Cancel        - " + getButtonString(global.keyboard_face_r)}; 
	    menu[0][7]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Use Ability   - " + getButtonString(global.keyboard_face_u)}; 
	    menu[0][8]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Prev Ability  - " + getButtonString(global.keyboard_shoulder_l)}; 
	    menu[0][9]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Next Ability  - " + getButtonString(global.keyboard_shoulder_r)}; 
	    menu[0][10] = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Pause         - " + getButtonString(global.keyboard_start)}; 
	    menu[0][11] = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Map           - " + getButtonString(global.keyboard_select)};
	}
	else{
	    menu[0][0]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Up            - " + getButtonString(global.joypad_up)}; 
	    menu[0][1]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Down          - " + getButtonString(global.joypad_down)}; 
	    menu[0][2]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Left          - " + getButtonString(global.joypad_left)}; 
	    menu[0][3]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Right         - " + getButtonString(global.joypad_right)}; 
	    menu[0][4]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Jump / Accept - " + getButtonString(global.joypad_face_d)}; 
	    menu[0][5]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Attack        - " + getButtonString(global.joypad_face_l)}; 
	    menu[0][6]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Cancel        - " + getButtonString(global.joypad_face_r)}; 
	    menu[0][7]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Use Ability   - " + getButtonString(global.joypad_face_u)}; 
	    menu[0][8]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Prev Ability  - " + getButtonString(global.joypad_shoulder_l)}; 
	    menu[0][9]  = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Next Ability  - " + getButtonString(global.joypad_shoulder_r)}; 
	    menu[0][10] = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Pause         - " + getButtonString(global.joypad_start)}; 
	    menu[0][11] = {_enabled: true, _value: CONTROLLS_INPUT, _label: "Map           - " + getButtonString(global.joypad_select)};
	}
}

function menuBack() {
	closeMenu();
}

function menuInteract() {
	switch(mpos){
	    case 0:
	        menu[0][0]._label  = "Up            - Waiting";
	        isWaiting = true;
	        break;
	    case 1:
	        menu[0][1]._label  = "Down          - Waiting";
	        isWaiting = true;
	        break;
	    case 2:
	        menu[0][2]._label  = "Left          - Waiting";
	        isWaiting = true;
	        break;
	    case 3:
	        menu[0][3]._label  = "Right         - Waiting";
	        isWaiting = true;
	        break;
	    case 4:
	        menu[0][4]._label  = "Jump / Accept - Waiting";
	        isWaiting = true;
	        break;
	    case 5:
	        menu[0][5]._label  = "Attack        - Waiting";
	        isWaiting = true;
	        break;
	    case 6:
	        menu[0][6]._label  = "Cancel        - Waiting";
	        isWaiting = true;
	        break;
	    case 7:
	        menu[0][7]._label  = "Use Ability   - Waiting";
	        isWaiting = true;
	        break;
	    case 8:
	        menu[0][8]._label  = "Prev Ability  - Waiting";
	        isWaiting = true;
	        break;
	    case 9: 
	        menu[0][9]._label  = "Next Ability  - Waiting";
	        isWaiting = true;
	        break;
	    case 10:
	        menu[0][10]._label = "Menu          - Waiting";
	        isWaiting = true;
	        break;
	    case 11: 
	        menu[0][11]._label = "Map           - Waiting";
	        isWaiting = true;
	        break;
	    case 12: //Accept
	        finalizeInputs();
			menuBack();
			break;
		case 13: //Back
			setupControls();
			menuBack();
			break;
	}
}

function setButton(buttonIndex, buttonKey) {
    if(buttonIndex != -1 && buttonKey != -1){
		var menuText = "";
        if(buttonKey != vk_escape){
            holdingButtons[buttonIndex] = buttonKey;
        }
        switch(buttonIndex){
            case 0:
                menuText = "Up            - *";
                break;
            case 1:
                menuText = "Down          - *";
                break;
            case 2:
                menuText = "Left          - *";
                break;
            case 3:
                menuText = "Right         - *";
                break;
            case 4:
                menuText = "Jump / Accept - *";
                break;
            case 5:
                menuText = "Attack        - *";
                break;
            case 6:
                menuText = "Cancel        - *";
                break;
            case 7:
                menuText = "Use Ability   - *";
                break;
            case 8:
                menuText = "Prev Ability  - *";
                break;
            case 9:
                menuText = "Next Ability  - *";
                break;
            case 10:
                menuText = "Pause         - *";
                break;
            case 11:
                menuText = "Pause         - *";
                break;
            default:
                menuText = "Other         - *";
                break;
        }
        menu[0][buttonIndex]._label = menuText + getButtonString(holdingButtons[buttonIndex]);
    }
}

function finalizeInputs() {
	if(!global.usingJoypad){
	    global.keyboard_up = holdingButtons[0];
	    global.keyboard_down = holdingButtons[1];
	    global.keyboard_left = holdingButtons[2];
	    global.keyboard_right = holdingButtons[3];
	    global.keyboard_face_d = holdingButtons[4];
	    global.keyboard_face_l = holdingButtons[5];
	    global.keyboard_face_r = holdingButtons[6];
	    global.keyboard_face_u = holdingButtons[7];
	    global.keyboard_shoulder_l = holdingButtons[8];
	    global.keyboard_shoulder_r = holdingButtons[9];
	    global.keyboard_start = holdingButtons[10];
	    global.keyboard_select = holdingButtons[11];
	}
	else{
	    global.joypad_up = holdingButtons[0];
	    global.joypad_down = holdingButtons[1];
	    global.joypad_left = holdingButtons[2];
	    global.joypad_right = holdingButtons[3];
	    global.joypad_face_d = holdingButtons[4];
	    global.joypad_face_l = holdingButtons[5];
	    global.joypad_face_r = holdingButtons[6];
	    global.joypad_face_u = holdingButtons[7];
	    global.joypad_shoulder_l = holdingButtons[8];
	    global.joypad_shoulder_r = holdingButtons[9];
	    global.joypad_start = holdingButtons[10];
	    global.joypad_select = holdingButtons[11];
	}
	setupControls();
}
setupControls();

//hackery for menu size purposes
holdingMenu9 = menu[0][9]._label;
menu[0][9]._label = "Jump / Accept - *select ";
calculateMenuBoundary();
menu[0][9]._label = holdingMenu9;