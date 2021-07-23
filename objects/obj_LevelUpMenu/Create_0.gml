event_inherited();
//Set up Menu array
menu = [];
menu[0] = [];
menu[0][3] = {_enabled: true, _value: MENU_BACK, _label: "Back"};


function menuBack() {
	if(greenState){
		greenState = false;
	} else {
		closeMenu();
	}
}

function setupMenu(){
	canLevelAttack = (global.player.attackLevel < LEVEL_MAX && global.player.experience >= global.player.attackExpCost);
	canLevelDefense = (global.player.defenseLevel < LEVEL_MAX && global.player.experience >= global.player.defenseExpCost);
	canLevelMagic = (global.player.magicLevel < LEVEL_MAX && global.player.experience >= global.player.magicExpCost);
	menu[0][0] = {_enabled: canLevelAttack, _value: LEVEL_UP_ATTACK,   _label: "Attack (" + string(global.player.attackLevel) + ")" + (global.player.attackLevel >= LEVEL_MAX ? "" : " - " + string(global.player.attackExpCost) + "xp")};
	menu[0][1] = {_enabled: canLevelMagic, _value: LEVEL_UP_MAGIC,     _label: "Magic (" + string(global.player.magicLevel) + ")" + (global.player.magicLevel >= LEVEL_MAX ? "" : " - " + string(global.player.magicExpCost) + "xp")};
	menu[0][2] = {_enabled: canLevelDefense, _value: LEVEL_UP_DEFENSE, _label: "Defense (" + string(global.player.defenseLevel) + ")" + (global.player.defenseLevel >= LEVEL_MAX ? "" : " - " + string(global.player.defenseExpCost) + "xp")};
}

function menuInteract() {
	switch(menu[0][mpos]._value){
	    case LEVEL_UP_ATTACK:
			if(greenState){
				global.player.experience -= global.player.attackExpCost;
				levelUpAttack();
				greenState = false;
				setupMenu();
			} else {
				greenState = true;	
			}
	        break;
	    case LEVEL_UP_MAGIC:
			if(greenState){
				global.player.experience -= global.player.magicExpCost;
				levelUpMagic();
				greenState = false;
				setupMenu();
			} else {
				greenState = true;	
			}
	        break;
	    case LEVEL_UP_DEFENSE:
			if(greenState){
				global.player.experience -= global.player.defenseExpCost;
				levelUpDefense();
				greenState = false;
				setupMenu();
			} else {
				greenState = true;	
			}
	        break;
	    case MENU_BACK:
			menuBack();
	        break;
	}
}
setupMenu();
var holdingMenu = menu[0][0]._label;
menu[0][0]._label = "Attack (99) - 99999xp";
calculateMenuBoundary();
menu[0][0]._label = holdingMenu;