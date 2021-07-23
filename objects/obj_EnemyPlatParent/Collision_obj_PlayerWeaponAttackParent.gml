if(iTime <= 0){
	hp = clamp(hp-global.player.attack, 0, 99);
	
	playEffect(snd_EnemyHurt);
	
	receiveForceV(2);
	carryFromHit = true;
	horSpeedMax += HIT_SPEED_INCREASE;
	if(other.x > x){
		receiveForceH(-HIT_SPEED_INCREASE);
	} else {
		receiveForceH(HIT_SPEED_INCREASE);
	}
	
	iTime = iTimeMax;
}