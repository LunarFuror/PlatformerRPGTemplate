if(instance_exists(obj_TextBoxQueued)){
	with(obj_TextBoxQueued) ticket --;
} else {
	if(!instance_exists(obj_MenuParent)){
		global.gamePaused = false;
	}
}
instance_destroy();