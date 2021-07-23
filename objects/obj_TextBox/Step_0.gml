lerpProgress += (1-lerpProgress) / 50;
textProgress += FONT_SPEED;

x1 = lerp(x1,x1Target,lerpProgress);
x2 = lerp(x2,x2Target,lerpProgress);

if (getInputFaceDownPressed()){
	var _messageLength = string_length(content);
	if(textProgress >= _messageLength){
		//TODO: Fancy Close
		//Destroy after brief delay to prevent objects from reopening immediately
		alarm_set(0,1);
	} else if (textProgress > 2) {
		textProgress = _messageLength;
	}
}