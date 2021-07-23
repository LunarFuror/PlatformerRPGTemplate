
if (hp <= 0){
	die();
}

if (iTime > 0) { 
	iTime --;
} else { 
	if(carryFromHit){
		carryFromHit = false; 
		horSpeedMax -= HIT_SPEED_INCREASE;
	} else {
		horSpeedMax = horSpeedMaxInitial;
	}
}