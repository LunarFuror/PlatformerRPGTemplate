if(lerpProgress < 1){
	lerpProgress = clamp(lerpProgress + ((1-lerpProgress) / 50), 0,1);
	if(lerpProgress > .4){
		lerpProgress = 1;
	}
}
x1 = lerp(x1,x1Target,lerpProgress);
x2 = lerp(x2,x2Target,lerpProgress);
y1 = lerp(y1,y1Target,lerpProgress);
y2 = lerp(y2,y2Target,lerpProgress);

switch(state){
	case 0: //Opening menu
		if(lerpProgress > .25){
			state = 1;
			lerpProgress = 1;
		}
		break;
	case 2: //Closing menu
		if(lerpProgress > .25){
			global.activeMenu = callingMenu;
			if(unpauseFlag && global.activeMenu = -1){
				global.gamePaused = false;
			}
			instance_destroy();
		}
		break;
}