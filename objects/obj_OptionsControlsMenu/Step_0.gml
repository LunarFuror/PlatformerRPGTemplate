event_inherited();

if(instance_exists(obj_RoomTransition)) exit;
if(global.activeMenu != id) exit;

if(state == 1){
	if(!isWaiting){
		checkInputs(menuInteract, menuBack);
	    isClear = false;
	}
	else{
		//wait for no input
	    if(!isClear){
	        if(getInputNothing()){
	            isClear = true;
	            input_last = -1;
	        }
	    }
	    else{
	        if(!getInputNothing()){
	            setButton(mpos, getLastInput());
	            isWaiting = false;
	        }
	    }
	}
}