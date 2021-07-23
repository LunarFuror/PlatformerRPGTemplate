event_inherited();

if(instance_exists(obj_RoomTransition)) exit;
if(global.activeMenu != id) exit;

if(state == 1){
	checkInputs(menuInteract, menuBack);
	
	if(getInputRightPressed()){
	    playEffect(snd_CursorMove);
	    if(menu[0][mpos]._value == SOUND_MASTER){
	        if(holdingMasterVolume + 5 > 100){
	            holdingMasterVolume = 100;
	        }
	        else{
	            holdingMasterVolume += 5;
	        }
	        menu[0][0]._label = "Master Volume - " + string(holdingMasterVolume);
	    } else if(menu[0][mpos]._value == SOUND_MUSIC){
	        if(holdingMusicVolume + 5 > 100){
	            holdingMusicVolume = 100;
	        }
	        else{
	            holdingMusicVolume += 5;
	        }
	        menu[0][1]._label = "Music Volume  - " + string(holdingMusicVolume);
	    } else if(menu[0][mpos]._value == SOUND_EFFECTS){
	        if(holdingEffectVolume + 5 > 100){
	            holdingEffectVolume = 100;
	        }
	        else{
	            holdingEffectVolume += 5;
	        }
	        menu[0][2]._label = "Effect Volume - " + string(holdingEffectVolume);
	    }
	}
    
	if(getInputLeftPressed()){
	    playEffect(snd_CursorMove);
	    if(menu[0][mpos]._value == SOUND_MASTER){
	        if(holdingMasterVolume - 5 < 0){
	            holdingMasterVolume = 0;
	        }
	        else{
	            holdingMasterVolume -= 5;
	        }
	        menu[0][0]._label = "Master Volume - " + string(holdingMasterVolume);
	    } else if(menu[0][mpos]._value == SOUND_MUSIC){
	        if(holdingMusicVolume - 5 < 0){
	            holdingMusicVolume = 0;
	        }
	        else{
	            holdingMusicVolume -= 5;
	        }
	        menu[0][1]._label = "Music Volume  - " + string(holdingMusicVolume);
	    } else if(menu[0][mpos]._value == SOUND_EFFECTS){
	        if(holdingEffectVolume - 5 < 0){
	            holdingEffectVolume = 0;
	        }
	        else{
	            holdingEffectVolume -= 5;
	        }
	        menu[0][2]._label = "Effect Volume - " + string(holdingEffectVolume);
	    }
	}
}