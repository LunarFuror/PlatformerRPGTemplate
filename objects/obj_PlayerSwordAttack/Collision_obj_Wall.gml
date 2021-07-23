if (instance_exists(obj_PlayerParent)){
	with(other){
		if(other.x > x){
			obj_PlayerParent.receiveForceH(2);	
		} else {
			obj_PlayerParent.receiveForceH(-2);	
		}
	}
}