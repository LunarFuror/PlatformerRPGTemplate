event_inherited();

if(instance_exists(obj_RoomTransition)) exit;
if(global.activeMenu != id) exit;

if(state == 1){
	checkInputs(menuInteract, menuBack);
	if(greenState){
		var move = 0;
		move -= max(getInputUpPressed(),0);
		move += max(getInputDownPressed(),0);
		if(move != 0){
			greenState = false;
		}
	}
}