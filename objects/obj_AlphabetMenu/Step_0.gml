if(instance_exists(obj_RoomTransition)) exit;

var moveX = 0;
moveX -= max(getInputLeftPressed(),0);
moveX += max(getInputRightPressed(),0);

var moveY = 0;
moveY -= max(getInputUpPressed(),0);
moveY += max(getInputDownPressed(),0);

if(moveX != 0){
    playEffect(snd_CursorMove);
    mXPos += moveX;
    if(mXPos < 0) { mXPos = array_length(menu[mYPos]) - 1; }
    if(mXPos > array_length(menu[mYPos]) - 1) { mXPos = 0; }
}

if(moveY != 0){
    playEffect(snd_CursorMove);
    mYPos += moveY;
    if(mYPos < 0) { mYPos = array_length(menu) - 1; }
    if(mYPos > array_length(menu) - 1) { mYPos = 0; }
    if(mXPos < 0) { mXPos = array_length(menu[mYPos]) - 1; }
    if(mXPos > array_length(menu[mYPos]) - 1) { mXPos = 0; }
}

if(getInputFaceDownPressed() || getInputFaceLeftPressed()) {
    playEffect(snd_CursorSelect);
    alphabetMenuInteract();
}

if(getInputFaceUpPressed()){
    playEffect(snd_CursorSelect);
	alphabetMenuBack();	
}
