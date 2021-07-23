function makeJumpDust(){
	instance_create_depth(x+(horSpeed/2), getBottomY()+1, depth-1, obj_JumpDust);	
}

function makeWalkDust(){
	var dust = instance_create_depth(x+(horSpeed), getBottomY()+1, depth-1, obj_WalkDust);
	dust.image_xscale = image_xscale;
}