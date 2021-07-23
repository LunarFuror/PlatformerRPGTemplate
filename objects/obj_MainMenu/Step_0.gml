event_inherited();

if(instance_exists(obj_RoomTransition)) exit;
if(global.activeMenu != id) exit;

if(state == 1){
	checkInputs(menuInteract, menuBack); // On parent
	//reset state if moved
	if(menu[0][mpos]._value != MENU_BACK){
		redState = false;
	}
}