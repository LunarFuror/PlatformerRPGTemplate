function saveGame(fileName){
	//Handle some stuff that wasn't being handled
	global.gameState.saveRoom = room;
	if(instance_exists(obj_PlayerParent)){
		global.player._x = obj_PlayerParent.x;
		global.player._y = obj_PlayerParent.y;
	}
	
	if(file_exists(fileName + ".sav")) file_delete(fileName + ".sav");
	//Create and open save file
	ini_open(fileName + ".sav");

	// ============ PLAYER STATE ===============================================================
	ini_write_string("Player","hp", global.player.hp);
	ini_write_string("Player","hpMax", global.player.hpMax);
	ini_write_string("Player","mp", global.player.mp);
	ini_write_string("Player","mpMax", global.player.mpMax);
	ini_write_string("Player","keys", global.player.keys);
	ini_write_string("Player","money", global.player.money);
	ini_write_string("Player","moneyMax", global.player.moneyMax);
	ini_write_string("Player","experience", global.player.experience);
	ini_write_string("Player","jumpPower", global.player.jumpPower);
	ini_write_string("Player","extraJumpsMax", global.player.extraJumpsMax);
	ini_write_string("Player","weapon", global.player.weapon);
	ini_write_string("Player","ability", global.player.ability);
	ini_write_string("Player","attackExpCost", global.player.attackExpCost);
	ini_write_string("Player","magicExpCost", global.player.magicExpCost);
	ini_write_string("Player","defenseExpCost", global.player.defenseExpCost);
	ini_write_string("Player","attack", global.player.attack);
	ini_write_string("Player","defense", global.player.defense);
	ini_write_string("Player","magic", global.player.magic);
	ini_write_string("Player","attackLevel", global.player.attackLevel);
	ini_write_string("Player","defenseLevel", global.player.defenseLevel);
	ini_write_string("Player","magicLevel", global.player.magicLevel);
	ini_write_string("Player","positionX", global.player._x);
	ini_write_string("Player","positionY", global.player._y);

	// ============ GAME STATE ===============================================================
	ini_write_real("Game","saveRoom",global.gameState.saveRoom);
	ini_write_real("Game","roomSound",global.gameState.roomSound);
	ini_write_real("Game","knifeCollected", global.gameState.knifeCollected);
	ini_write_real("Game","swordCollected", global.gameState.swordCollected);
	ini_write_real("Game","vineshroomUnlocked", global.gameState.vineshroomUnlocked);
	ini_write_real("Game","scootUnlocked", global.gameState.scootUnlocked);
	ini_write_real("Game","meatUnlocked", global.gameState.meatUnlocked);
	ini_write_real("Game","chatUnlocked", global.gameState.chatUnlocked);
	ini_write_string("Game","SaveName", global.gameState.saveName);

	//close and save the file
	ini_close();
}

function loadGame(fileName){
	initializeGame();
	if(file_exists(fileName + ".sav")){
	    //Open save file
	    ini_open(fileName + ".sav");
    
	    global.gameState.saveFileName = fileName;

		// ============ PLAYER STATE ===============================================================
		//this needs to convert from string to appropriate datatype
		global.player.hp				= real(ini_read_string("Player","hp",string(global.player.hp)));
		global.player.hpMax				= real(ini_read_string("Player","hpMax",string(global.player.hpMax)));
		global.player.mp				= real(ini_read_string("Player","mp",string(global.player.mp)));
		global.player.mpMax				= real(ini_read_string("Player","mpMax",string(global.player.mpMax)));
		global.player.keys				= real(ini_read_string("Player","keys",string(global.player.keys)));
		global.player.money				= real(ini_read_string("Player","money",string(global.player.money)));
		global.player.moneyMax			= real(ini_read_string("Player","moneyMax",string(global.player.moneyMax)));
		global.player.experience		= real(ini_read_string("Player","experience",string(global.player.experience)));
		global.player.jumpPower			= real(ini_read_string("Player","jumpPower",string(global.player.jumpPower)));
		global.player.extraJumpsMax		= real(ini_read_string("Player","extraJumpsMax",string(global.player.extraJumpsMax)));
		global.player.weapon			= real(ini_read_string("Player","weapon",string(global.player.weapon)));
		global.player.ability			= real(ini_read_string("Player","ability",string(global.player.weapon)));
		global.player.attackExpCost		= real(ini_read_string("Player","attackExpCost",string(global.player.attackExpCost)));
		global.player.magicExpCost		= real(ini_read_string("Player","magicExpCost",string(global.player.magicExpCost)));
		global.player.defenseExpCost	= real(ini_read_string("Player","defenseExpCost",string(global.player.defenseExpCost)));
		global.player.attack			= real(ini_read_string("Player","attack",string(global.player.attack)));
		global.player.defense			= real(ini_read_string("Player","defense",string(global.player.defense)));
		global.player.magic				= real(ini_read_string("Player","magic",string(global.player.magic)));
		global.player.attackLevel		= real(ini_read_string("Player","attackLevel",string(global.player.attackLevel)));
		global.player.defenseLevel		= real(ini_read_string("Player","defenseLevel",string(global.player.defenseLevel)));
		global.player.magicLevel		= real(ini_read_string("Player","magicLevel",string(global.player.magicLevel)));

		// ============ GAME STATE ===============================================================
	    global.gameState.saveRoom = real(ini_read_string("Game","saveRoom","0"));
	    global.gameState.roomSound = real(ini_read_string("Game","roomSound","0"));
	    global.gameState.knifeCollected = real(ini_read_string("Game","knifeCollected","0"));
	    global.gameState.swordCollected = real(ini_read_string("Game","swordCollected","0"));
	    global.gameState.vineshroomUnlocked = real(ini_read_string("Game","vineshroomUnlocked","0"));
	    global.gameState.scootUnlocked = real(ini_read_string("Game","scootUnlocked","0"));
	    global.gameState.meatUnlocked = real(ini_read_string("Game","meatUnlocked","0"));
	    global.gameState.chatUnlocked = real(ini_read_string("Game","chatUnlocked","0"));
	    global.gameState.saveName		= ini_read_string("Game","SaveName","Empty");
		
		var playerX = real(ini_read_string("Player","positionX", "0"));
		var playerY = real(ini_read_string("Player","positionY", "0"));
   
	    //close file
	    ini_close();
	    transitionRoom(global.gameState.saveRoom, FADE_MEDIUM, global.gameState.roomSound, FADE_CONSISTENT, false, playerX, playerY, -1);
	} else {
	    //go to the player naming room
	    global.gameState.saveFileName = fileName;
	    transitionRoom(rm_NameMenu, FADE_MEDIUM, mus_MainTheme, FADE_CONSISTENT, false, -1, -1, -1);
	}
}

function deleteGame(fileName){
	if(file_exists(fileName + ".sav")) file_delete(fileName + ".sav");
    
	var saveName1 = "Empty";
	var saveName2 = "Empty";
	var saveName3 = "Empty";
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

	menu[1,0] = "Save 1: " + saveName1; 
	menu[1,1] = "Save 2: " + saveName2; 
	menu[1,2] = "Save 3: " + saveName3; 

	menu[7,0] = "Save 1: " + saveName1; 
	menu[7,1] = "Save 2: " + saveName2; 
	menu[7,2] = "Save 3: " + saveName3; 
}

function initializeGame(){	
	initializePlayer();
	initializeGameState();
}

function initializeGameState(){
	global.gameState.knifeCollected = false;
	global.gameState.swordCollected = false;
	global.gameState.vineshroomUnlocked = false;
	global.gameState.scootUnlocked = false;
	global.gameState.meatUnlocked = false;
	global.gameState.chatUnlocked = false;
	global.gameState.saveRoom = OVERWORLD_ROOM;
	global.gamePaused = false;
	global.activeMenu = -1;
}

function initializePlayer(){	
	global.player = {
		hp				: 8,
		hpMax			: 8,
		mp				: 0,
		mpMax			: 0,
		keys			: 0,
		money			: 0,
		moneyMax		: 99,
		experience		: 0,
		jumpPower		: 4.5,
		extraJumpsMax	: 0,
		extraJumpsLeft	: 0,
		weapon			: -1,
		ability			: -1,
		attackExpCost	: 200,
		magicExpCost	: 100,
		defenseExpCost	: 50,
		attack			: 1,
		defense			: 1,
		magic			: 1,
		attackLevel		: 1,
		defenseLevel	: 1,
		magicLevel		: 1,
		_x				: 0,
		_y				: 0, 
		mapX			: 184,
		mapY			: 553,
		isDead			: false
	}
}

function initializeGlobals() {
	// ========= SETTINGS ===========================================================
	//control settings
	global.usingJoypad = 0;
	global.currentJoypadIndex = -1;

	//if there's a joypad, default to it.
	var detectedJoypad = detectConnectedJoypad();
	if(detectedJoypad != -1){
		global.usingJoypad = 1;
		global.currentJoypadIndex = detectedJoypad;
	}

	//default controlls, snes control limit
	global.keyboard_right = vk_right;
	global.keyboard_left = vk_left;
	global.keyboard_up = vk_up;
	global.keyboard_down = vk_down;
	global.keyboard_face_d = ord("Z");
	global.keyboard_face_l = ord("X");
	global.keyboard_face_u = ord("C");
	global.keyboard_face_r = ord("A");
	global.keyboard_shoulder_l = ord("S");
	global.keyboard_shoulder_r = ord("D");
	global.keyboard_start = vk_enter;
	global.keyboard_select = vk_control;

	global.joypad_right = gp_padr;
	global.joypad_left = gp_padl;
	global.joypad_up = gp_padu;
	global.joypad_down = gp_padd;
	global.joypad_face_d = gp_face1;
	global.joypad_face_l = gp_face3;
	global.joypad_face_u = gp_face4;
	global.joypad_face_r = gp_face2;
	global.joypad_shoulder_l = gp_start;
	global.joypad_shoulder_r = gp_select;
	global.joypad_start = gp_start;
	global.joypad_select = gp_select;

	//other settings stuff
	global.masterVolume = 50;
	global.musicVolume = 100;
	global.effectVolume = 100;

	global.fullscreen = 0; //0: window, 1: full, 2: borderless window
	global.resolution = 3;

	// ========= GAME SYSTEM ===========================================================
	//gameplay flags
	global.gamePaused = false;
	global.activeMenu = -1;

	//font stuff
	global._fontLayout = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz 0123456789_-<>.,:;'/!?*()[]";
	for(var i = 0; i <= 255; i ++){ global._charMap[i] = -1; }
	for(var i = 1; i <= string_length(global._fontLayout); i ++){ global._charMap[ord(string_char_at(global._fontLayout, i))] = i; }

	// ========= GAME STATE ===========================================================
	// unsure if needed, but json of everything we want to track as we play, like if key items were collected
	// TODO: There's gotta be a better dynamic way to check this... I don't want to have to manually put every chest and key item in here
	global.gameState = {
		knifeCollected		: false,
		swordCollected		: false,
		vineshroomUnlocked	: false,
		scootUnlocked		: false,
		meatUnlocked		: false,
		chatUnlocked		: false,
		saveFileName		: "save1.sav",
		saveRoom			: OVERWORLD_ROOM,
		roomSound			: mus_MainTheme
	}	
}