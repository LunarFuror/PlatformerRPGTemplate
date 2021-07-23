event_inherited();
///Instantiate Variables
holdingMasterVolume = global.masterVolume;
holdingMusicVolume = global.musicVolume;
holdingEffectVolume = global.effectVolume;

//Set up Menu array
menu = [];
menu[0] = [];
menu[0][0] = {_enabled: true, _value: SOUND_MASTER, _label:  "Master Volume - " + string(global.masterVolume)};
menu[0][1] = {_enabled: true, _value: SOUND_MUSIC, _label:   "Music Volume  - " + string(global.musicVolume)};
menu[0][2] = {_enabled: true, _value: SOUND_EFFECTS, _label: "Effect Volume - " + string(global.effectVolume)};
menu[0][3] = {_enabled: true, _value: SOUND_ACCEPT, _label: "Accept"};
menu[0][4] = {_enabled: true, _value: MENU_BACK, _label: "Back"};

//hackery for menu size purposes
holdingMenu0 = menu[0][0]._label;
menu[0][0]._label = "Master Volume - 100";
calculateMenuBoundary();
menu[0][0]._label = holdingMenu0;


function menuBack() {
	closeMenu();
}

function menuInteract() {
	switch(menu[0][mpos]._value){
	    case SOUND_MASTER:
	        break;
	    case SOUND_MUSIC:
	        break;
	    case SOUND_EFFECTS:
	        break;
	    case SOUND_ACCEPT:
			global.masterVolume = holdingMasterVolume;
			global.musicVolume = holdingMusicVolume;
			global.effectVolume = holdingEffectVolume;
			audio_sound_gain(global.gameState.roomSound,(global.musicVolume/100)*(global.masterVolume/100),0);
			menuBack();
	        break;
	    case MENU_BACK:
			menuBack();
	        break;
	}
}