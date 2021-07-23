if(global.gamePaused) { image_speed = 0; exit; }

if(!instance_exists(obj_TextBox) && !instance_exists(obj_TextBoxQueued)
		&& (place_meeting(x, y, obj_PlayerTopDown) && getInputFaceDownPressed()) 
		|| (place_meeting(x, y, obj_PlayerPlatformer) && getInputUpPressed())){
	if(!interactOnce){
		interact();
	} else if (!itemsRecieved){
		itemsRecieved = true;
		interact();
	}
}