if(global.player.hp <= 0 && !global.player.isDead){
    playerDeath();
}

if(room == rm_Initialize
|| room == rm_StartScreen
|| room == rm_NameMenu
|| room == rm_GameOver){
	showUi = false;	
} else {
	showUi = true;
}

//TODO: might be a better way to flag this
if(showUi && getInputStartPressed() 
	&& !instance_exists(obj_TextBox) 
	&& !instance_exists(obj_MenuParent) 
	&& !instance_exists(obj_TextBoxQueued) 
	&& !instance_exists(obj_RoomTransition)){
	if(global.gamePaused == false){
		instance_create_depth(CAMERA_WIDTH/2, CAMERA_HEIGHT/2, DEPTH_UI + 1, obj_PauseMenu);
	}
}

//anti-soft-lock should go from 0mp to 5mp in 1 minute.
if(!global.gamePaused && global.player.mpMax > 0 && global.player.mp < 5){
	magicFillTime --;
	if(magicFillTime <= 0){
		global.player.mp = clamp(global.player.mp + 1, 0, global.player.mpMax);
		magicFillTime = magicFillRate * (global.player.mp + 1); // the more mp you have the longer it takes to get one.
	}
}