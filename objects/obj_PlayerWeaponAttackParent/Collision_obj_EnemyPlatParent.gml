if (!collisionProcessed){
	playEffect(snd_HitWall);
	obj_PlayerParent.receiveForceH(obj_PlayerParent.image_xscale * -1);
	collisionProcessed = true;
}