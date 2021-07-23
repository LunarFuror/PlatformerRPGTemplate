if( global.gamePaused ) { exit; }
y -= liveTimer/120;
liveTimer --;
if(liveTimer <= 0){
	instance_destroy();	
}