///Instantiate Variables
depth = DEPTH_UI;
image_alpha = 0;

//the menu that opened this one. Should be -1 if this is the "root menu"
callingMenu = global.activeMenu;
//make this menu the active one;
global.activeMenu = id;

menu[0][0] = {_value: MENU_BACK, _label: "Back"}

_x = x;
_y = y;
x1 = x-8;
x2 = x+8;
y1 = y-8;
y2 = y+8;
x1Target = x-8;
x2Target = x+8;
y1Target = y-8;
y2Target = y+8;

function closeMenu(){
	//optional parameters, at time of writing this is how to do it :/
	unpauseFlag = argument_count > 0 ? argument[0] : false;
	state = 2;
	lerpProgress = 0;
	x1Target = _x;
	x2Target = _x;
	y1Target = _y;
	y2Target = _y;
}

//Set initial boundaries for the menu
function calculateMenuBoundary() {
	x1 = x1Target;
	x2 = x2Target;
	y1 = y1Target;
	y2 = y2Target;
	lerpProgress = 0;
	fadeIn = 0;
	
	setDrawText(font, fa_left, fa_middle, c_white);
	
	var largestStringIndex = 0;
	var largestStringLength = 0;
	for (var i = 0; i < array_length(menu[currentMenu]); i++){
		if(string_length(menu[currentMenu][i]._label) > largestStringLength){
			largestStringIndex = i;
			largestStringLength = string_length(menu[currentMenu][i]._label);
		}
	}

	var totalMenuWidth = sprite_get_width(spr_MainMenuCursor) + (PADDING*2) + font_get_size(font) + (string_width(menu[currentMenu][largestStringIndex]._label));
	var halfMenuWidth = totalMenuWidth/2;
	x1Target = _x-halfMenuWidth;
	x2Target = _x+halfMenuWidth;
	
	var numberOfMenuItems = array_length(menu[currentMenu]);
	var totalMenuHeight = numberOfMenuItems*(font_get_size(font)) + (PADDING * 1.8);
	var halfMenuHeight = totalMenuHeight/2;
	y1Target = _y-halfMenuHeight;
	y2Target = _y+halfMenuHeight;
}

function checkInputs(menuInteract, menuBack) {
	var move = 0;
	move -= max(getInputUpPressed(),0);
	move += max(getInputDownPressed(),0);

	if(move != 0){
	    playEffect(snd_CursorMove);
		confirmingQuit = false;
	    mpos += move;
	    if(mpos < 0) { mpos = array_length(menu[currentMenu]) - 1; }
	    if(mpos >  array_length(menu[currentMenu]) - 1) { mpos = 0; }
	}
    
	if(getInputFaceDownPressed()) {
		if(menu[currentMenu][mpos]._enabled){
		    playEffect(snd_CursorSelect);
			//defined in individual create
		    menuInteract();
		}
	}
    
	if(getInputFaceRightPressed()) {
	    playEffect(snd_CursorSelect);
		//defined in individual create
	    menuBack();
	}
}