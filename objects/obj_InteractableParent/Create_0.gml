function interact(){
	for(var i = 0; i < array_length(interactions); i ++){
		switch(interactions[i]){
			case I_SHOW_MESSAGE: 
				var _messages = string_split(messageText, ";");
				for(var j = 0; j < array_length(_messages); j++){
					newTextBox(_messages[j], style, font);
				}
				break;
			case I_GIVE_MONEY: 
				changeMoney(moneyWorth);
				break;
			case I_GIVE_KEYS: 
				changeKeys(keyWorth);
				break;
			case I_GIVE_HEALTH: 
				changeHp(healthWorth);
				break;
			case I_GIVE_MANA: 
				changeMp(manaWorth);
				break;
			case I_GIVE_ITEMS: 
				for(var j = 0; j < array_length(targetItems); j ++){
					instance_create_depth(obj_PlayerParent.x, obj_PlayerParent.y, DEPTH_PLAYER+1, targetItems[j]);
				}
				break;
			case I_GIVE_EXPERIENCE: 
				changeXp(experienceWorth);
				var expObj = instance_create_depth(obj_PlayerParent.x, obj_PlayerParent.y-16, DEPTH_PLAYER-1, obj_ExpNumber);
				expObj.expValue = experienceWorth;
				break;
			case I_MOVE_ROOM:
				transitionRoom(targetRoom, FADE_FAST,targetRoomSound, FADE_OUTWARD, false, -1, -1, targetRoomFacingRight);
				break;
		}
	}
}