if(drop != -1){
	var droppedItem = instance_create_depth(x, y, DEPTH_OBJECT, drop);
	droppedItem.worth = dropWorth;
}

instance_destroy();