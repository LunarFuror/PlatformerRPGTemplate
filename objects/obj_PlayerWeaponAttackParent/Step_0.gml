if(!global.gamePaused) { image_speed = 1;}
if(global.gamePaused) { image_speed = 0; exit; }

if(instance_exists(obj_PlayerPlatformer)){
	xTarget = obj_PlayerPlatformer.x;
	yTarget = obj_PlayerPlatformer.y + yOffset;
	image_xscale = obj_PlayerPlatformer.image_xscale;
} else {
	instance_destroy();	
}

x = xTarget;
y = yTarget;

if(tile_meeting_precise(x, y, "Walls")){
	if (!collisionProcessed){
		playEffect(snd_HitWall);
		obj_PlayerParent.receiveForceH(obj_PlayerParent.image_xscale * -2);
		collisionProcessed = true;
	}
}