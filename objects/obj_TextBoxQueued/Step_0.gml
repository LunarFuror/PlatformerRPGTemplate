if(ticket == 0){
	//instance_change(obj_TextBox, true);	
	var newText = instance_create_depth(x, y, depth, obj_TextBox);
	newText.content = content;
	newText.font = font;
	newText.style = style;
	instance_destroy();
}