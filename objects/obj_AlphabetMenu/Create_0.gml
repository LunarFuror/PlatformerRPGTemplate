///Instantiate Variables
font = spr_MainFont;
mXPos=0;
mYPos=0;
_x = camera_get_view_x(0);
_y = camera_get_view_y(0);
xSpacing = (sprite_get_width(font)*2)-1;
ySpacing = sprite_get_height(font);
tempName = "";

//Set up Menu arrays menu[y,x]
menu[0][0] = "A"; 
menu[0][1] = "B";
menu[0][2] = "C";
menu[0][3] = "D";
menu[0][4] = "E";
menu[0][5] = "F";
menu[0][6] = "G";
menu[0][7] = "H";
menu[0][8] = "I";
menu[0][9] = "J";
menu[0][10] = "K";
menu[0][11] = "L";
menu[0][12] = "M";

menu[1][0] = "N"; 
menu[1][1] = "O";
menu[1][2] = "P";
menu[1][3] = "Q";
menu[1][4] = "R";
menu[1][5] = "S";
menu[1][6] = "T";
menu[1][7] = "U";
menu[1][8] = "V";
menu[1][9] = "W";
menu[1][10] = "X";
menu[1][11] = "Y";
menu[1][12] = "Z";

menu[2][0] = "a"; 
menu[2][1] = "b";
menu[2][2] = "c";
menu[2][3] = "d";
menu[2][4] = "e";
menu[2][5] = "f";
menu[2][6] = "g";
menu[2][7] = "h";
menu[2][8] = "i";
menu[2][9] = "j";
menu[2][10] = "k";
menu[2][11] = "l";
menu[2][12] = "m";

menu[3][0] = "n"; 
menu[3][1] = "o";
menu[3][2] = "p";
menu[3][3] = "q";
menu[3][4] = "r";
menu[3][5] = "s";
menu[3][6] = "t";
menu[3][7] = "u";
menu[3][8] = "v";
menu[3][9] = "w";
menu[3][10] = "x";
menu[3][11] = "y";
menu[3][12] = "z";

menu[4][0] = "0"; 
menu[4][1] = "1";
menu[4][2] = "2";
menu[4][3] = "3";
menu[4][4] = "4";
menu[4][5] = "5";
menu[4][6] = "6";
menu[4][7] = "7";
menu[4][8] = "8";
menu[4][9] = "9";
menu[4][10] = ".";
menu[4][11] = "-";
menu[4][12] = " ";

menu[5][0] = "BACK";
menu[6][0] = "END";

function alphabetMenuBack(){
	if(string_length(tempName) > 0){
	    tempName = string_delete(tempName,string_length(tempName),1);
	} else {
		transitionRoom(ROOM_START, FADE_MEDIUM, mus_Map, FADE_CONSISTENT, false, -1, -1, -1);
	}
}

function alphabetMenuInteract(){
	if(mYPos < 5){
	    if(string_length(tempName) < 6){
	        tempName += menu[mYPos,mXPos];
	    }
	}
	else{
	    switch(mYPos){
	        case 5: //Back
	            alphabetMenuBack();
	            break;
	        case 6: //End
	            if(string_length(tempName) > 0){
	                global.gameState.saveName = tempName;
	            } else {
					tempName = "Binyot"
	                global.gameState.saveName = tempName;
				}
	            global.gameState.saveRoom = OVERWORLD_ROOM;
	            transitionRoom(OVERWORLD_ROOM, FADE_SLOW, mus_Map, FADE_CONSISTENT, false, -1, -1, -1);
	            break;
	    }
	}
}