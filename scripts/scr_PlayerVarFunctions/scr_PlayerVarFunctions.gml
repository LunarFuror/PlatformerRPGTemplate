function playerDeath(){
	global.player.isDead = true;
	transitionRoom(rm_GameOver, FADE_MEDIUM, mus_GameOver, FADE_CONSISTENT, false, -1, -1, -1);
}

function levelUpAttack(){
	global.player.attackLevel += 1;
	if(global.player.attackLevel <= 5){
		global.player.attackExpCost += 200 * global.player.attackLevel * 1.5;
	} else {
		global.player.attackExpCost += 200 * global.player.attackLevel * 2.5;
	}
	
	if(global.player.attackLevel >= 0 && global.player.attackLevel <= 2){
		global.player.attack = 1;
	} else if (global.player.attackLevel >= 3 && global.player.attackLevel <= 4){
		global.player.attack = 2;
	} else if (global.player.attackLevel >= 5 && global.player.attackLevel <= 6){
		global.player.attack = 3;
	} else if (global.player.attackLevel >= 7 && global.player.attackLevel <= 9){
		global.player.attack = 4;
	} else if (global.player.attackLevel >= 10){
		global.player.attack = 5;
	}
	
	with obj_PlayerControlerUI {
		calculateLowestXp();
	}
}

function levelUpMagic(){
	global.player.magicLevel += 1
	if(global.player.magicLevel <= 5){
		global.player.magicExpCost += 100 * global.player.magicLevel * 2;
	} else {
		global.player.magicExpCost += 100 * global.player.magicLevel * 3;
	}
	
	if(global.player.magicLevel >= 0 && global.player.magicLevel <= 2){
		global.player.magic = 1;
	} else if (global.player.magicLevel >= 3 && global.player.magicLevel <= 4){
		global.player.magic = .8;
	} else if (global.player.magicLevel >= 5 && global.player.magicLevel <= 6){
		global.player.magic = .6;
	} else if (global.player.magicLevel >= 7 && global.player.magicLevel <= 9){
		global.player.magic = .4;
	} else if (global.player.magicLevel >= 10){
		global.player.magic = .2;
	}
	
	with obj_PlayerControlerUI {
		calculateLowestXp();
	}
}

function levelUpDefense(){
	global.player.defenseLevel += 1;
	if(global.player.defenseLevel <= 3){
		global.player.defenseExpCost += 50 * global.player.defenseLevel * 2.5;
	} else {
		global.player.defenseExpCost += 50 * global.player.defenseLevel * 4;
	}
	
	if(global.player.defenseLevel >= 0 && global.player.defenseLevel <= 2){
		global.player.defense = 1;
	} else if (global.player.defenseLevel >= 3 && global.player.defenseLevel <= 5){
		global.player.defense = .75;
	} else if (global.player.defenseLevel >= 6 && global.player.defenseLevel <= 9){
		global.player.defense = .5;
	} else if (global.player.defenseLevel >= 10){
		global.player.defense = .25;
	}
	
	with obj_PlayerControlerUI {
		calculateLowestXp();
	}
}

function changeXp(_amount){
	var _xpSpent = false;
	if(global.player.experience + _amount >= 0){
		global.player.experience = clamp(global.player.experience + _amount, 0, MAX_EXPERIENCE);
		_xpSpent = true;
	}
	return _xpSpent;
}

function changeHp(_amount){
	global.player.hp = clamp(global.player.hp + _amount, 0, global.player.hpMax);
	if(_amount < 0 && global.player.hp <= HEALTH_DANGER_THRESHOLD){
		playEffect(snd_HealthDanger);
	}
	return true;
}

function changeMp(_amount){
	var _manaSpent = false;
	if(global.player.mp + _amount >= 0){
		global.player.mp = clamp(global.player.mp + _amount, 0, global.player.mpMax);
		_manaSpent = true;
	}
	return _manaSpent;
}

function changeMaxHp(_amount){
	global.player.hpMax = min(global.player.hpMax + _amount, 80);
	return true;
}

function changeMaxMp(_amount){
	global.player.mpMax = min(global.player.mpMax + _amount, 50);
	return true;
}

function changeMoney(_amount){
	var _moneySpent = false;
	if(global.player.money + _amount >= 0){
		global.player.money = clamp(global.player.money + _amount, 0, global.player.moneyMax);
		var _moneySpent = true;
	}
	return _moneySpent;
}

function changeKeys(_amount){
	var _keysSpent = false;
	if(global.player.keys + _amount >= 0){
		global.player.keys = clamp(global.player.keys + _amount, 0, 99);
		var _keysSpent = true;
	}
	return _keysSpent;
}