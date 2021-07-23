if(!isActive){
	if(instance_exists(obj_Checkpoint)){
		with(obj_Checkpoint){ //set ALL checkpoints inactive
			isActive = false;	
		}
	}
	global.player1._x = x;
	global.player1._y = y;
	isActive = true; //activate this one
	//saveGame(global.gameState.saveFileName);
	activeTime = 60;
}