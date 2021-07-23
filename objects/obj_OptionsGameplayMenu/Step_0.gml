event_inherited();

if(instance_exists(obj_RoomTransition)) exit;
if(global.activeMenu != id) exit;

if(state == 1){
	checkInputs(menuInteract, menuBack);
}