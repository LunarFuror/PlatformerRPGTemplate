if(onGround()){
	var _didBounce = false;
	var _ourY = y;
	with other {
		if(!tile_meeting_precise(x, _ourY-20, "Walls") ){
			vertStop();
			y = _ourY-20;
			vertSpeed = -6;
			playEffect(snd_ShroomBounce);
			_didBounce = true;
		}
	}
	if(_didBounce){
		image_speed = 1;
	}
}