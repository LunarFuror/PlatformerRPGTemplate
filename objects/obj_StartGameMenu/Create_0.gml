event_inherited();
///Instantiate Variables

saveName1 = "Empty";
saveName2 = "Empty";
saveName3 = "Empty";
if(file_exists("save1.sav")){
    //Open save file
    ini_open("save1.sav");
    saveName1 = ini_read_string("Game","SaveName","Empty");
    ini_close();
}
if(file_exists("save2.sav")){
    //Open save file
    ini_open("save2.sav");
    saveName2 = ini_read_string("Game","SaveName","Empty");
    ini_close();
}
if(file_exists("save3.sav")){
    //Open save file
    ini_open("save3.sav");
    saveName3 = ini_read_string("Game","SaveName","Empty");
    ini_close();
}
//Set up Menu array
menu = [];
menu[0] = [];
array_push(menu[0], 
	{_enabled: true, _value: START_SAVE_1, _label: "Save 1: " + saveName1},
	{_enabled: true, _value: START_SAVE_2, _label: "Save 2: " + saveName2},
	{_enabled: true, _value: START_SAVE_3, _label: "Save 3: " + saveName3},
	{_enabled: true, _value: START_DELETE, _label: "Delete"},
	{_enabled: true, _value: MENU_BACK, _label: "Back"}
);


function menuBack() {
	closeMenu();
}

function menuInteract() {
	switch(menu[0][mpos]._value){
	    case START_SAVE_1:
			if(redState){
		        deleteGame("save1");
		        redState = false;
				menu[0][mpos]._label = "Save 1: Empty";
		        mpos = 0;
			} else {
				var saveFile = "save1";
				global.gameState.saveFileName = saveFile;
		        loadGame(saveFile);
			}
	        break;
	    case START_SAVE_2: //Save 2
			if(redState){
		        deleteGame("save2");
		        redState = false;
				menu[0][mpos]._label = "Save 2: Empty";
		        mpos = 0;
			} else {
				var saveFile = "save2";
				global.gameState.saveFileName = saveFile;
		        loadGame(saveFile);
			}
	        break;
	    case START_SAVE_3: //Save 3
			if(redState){
		        deleteGame("save3");
		        redState = false;
				menu[0][mpos]._label = "Save 3: Empty";
		        mpos = 0;
			} else {
				var saveFile = "save3";
				global.gameState.saveFileName = saveFile;
		        loadGame(saveFile);
			}
	        break;
	    case START_DELETE: //Delete
	        redState = true;
	        mpos = 0;
	        break;
	    case MENU_BACK: //Back
			menuBack();
	        break;
	}
}

calculateMenuBoundary();