event_inherited();

if(instance_exists(obj_RoomTransition)) exit;
if(instance_exists(obj_TextBox)) exit;

if(global.activeMenu != id) exit;

if(state == 1){
	checkInputs(menuInteract, menuBack);
	if(menu[0][mpos]._value != PAUSE_QUIT){
		redState = false;
	}
	if(getInputStartPressed()){
		closeMenu(true);
	}
}