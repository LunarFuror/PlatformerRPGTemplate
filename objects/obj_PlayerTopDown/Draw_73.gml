var _object = instance_place(x,y,obj_InteractableParent);
if ( _object
	&& (!_object.interactOnce || (_object.interactOnce && !_object.itemsRecieved))) {
	draw_sprite(spr_Interact,0,x,y-16);
}