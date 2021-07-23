drawSpriteText(x+xSpacing, y-(ySpacing*3), "What is your name?");
drawSpriteText(x+xSpacing, y-(ySpacing*2), tempName);

for (var mY = 0; mY < array_length(menu); mY++){
    for(var mX = 0; mX < array_length(menu[mY]); mX++){
		if(mY == mYPos && mX == mXPos){
			drawSpriteText(x + (xSpacing*(mX+1)), y + (ySpacing * mY), menu[mY, mX], c_lime);
		} else {
			drawSpriteText(x + (xSpacing*(mX+1)), y + (ySpacing * mY), menu[mY, mX]);
		}
    }
}

draw_sprite(sprite_index, 0, x + (xSpacing*mXPos) - 3, y + (mYPos * ySpacing)+5);