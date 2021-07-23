// ====== SPECIAL FUNCTIONS =================================================================================================



// ====== SPECIAL JOYPAD FUNCTIONS =================================================================================================
function getJoypadInputNothing(){
	var inputNothing = 1;
	for (var i = 32769; i < 32789; i++) {
	    if (gamepad_button_check(global.currentJoypadIndex, i)) {
	        inputNothing = 0;
	    }
	}
	return inputNothing;
}

function getLastJoypadInput(){
	var inputLast = -1;
	for (var i = 32769; i < 32789; i++) {
	    if (gamepad_button_check(global.currentJoypadIndex, i)) {
	        inputLast = i;
	    }
	}
	return inputLast;
}

function detectConnectedJoypad(){
	for (var i = 0; i < gamepad_get_device_count(); i++;) {
	   if gamepad_is_connected(i){
		   return i;
	   }
	}
	return -1;
}

function detectLastInputforJoypad(){
	input_last = -1;
	joypad_last = -1;
	connected_pads = 0;
	for (var j = 0; j < gamepad_get_device_count(); j++;) {
		if gamepad_is_connected(j){
			connected_pads += 1;
			for (var b = 32769; b < 32789; b++) {
				if (gamepad_button_check(j, b)) {
					input_last = b;
					joypad_last = j;
				}
			}
		}
	}
	
	return [input_last, joypad_last, connected_pads];
}

// ====== SPECIAL INPUTS =================================================================================================
function getLastInput(){
	if(global.usingJoypad){
		return getLastJoypadInput();
	} else {
		return keyboard_lastkey;
	}
}

function getInputNothing(){
	if(global.usingJoypad){
		return getJoypadInputNothing();
	} else {
		return keyboard_check(vk_nokey);
	}
}

// ====== DIRECTION INPUTS =================================================================================================
function getInputLeft(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_left);
	} else {
		return keyboard_check(global.keyboard_left);
	}
}

function getInputLeftPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_left);
	} else {
		return keyboard_check_pressed(global.keyboard_left);
	}
}

function getInputLeftReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_left);
	} else {
		return keyboard_check_released(global.keyboard_left);
	}
}

function getInputRight(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_right);
	} else {
		return keyboard_check(global.keyboard_right);
	}
}

function getInputRightPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_right);
	} else {
		return keyboard_check_pressed(global.keyboard_right);
	}
}

function getInputRightReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_right);
	} else {
		return keyboard_check_released(global.keyboard_right);
	}
}

function getInputUp(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_up);
	} else {
		return keyboard_check(global.keyboard_up);
	}
}

function getInputUpPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_up);
	} else {
		return keyboard_check_pressed(global.keyboard_up);
	}
}

function getInputUpReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_up);
	} else {
		return keyboard_check_released(global.keyboard_up);
	}
}

function getInputDown(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_down);
	} else {
		return keyboard_check(global.keyboard_down);
	}
}

function getInputDownPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_down);
	} else {
		return keyboard_check_pressed(global.keyboard_down);
	}
}

function getInputDownReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_down);
	} else {
		return keyboard_check_released(global.keyboard_down);
	}
}

// ====== FACE INPUTS =================================================================================================
function getInputFaceDown(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_face_d);
	} else {
		return keyboard_check(global.keyboard_face_d);
	}
}

function getInputFaceDownPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_face_d);
	} else {
		return keyboard_check_pressed(global.keyboard_face_d);
	}
}

function getInputFaceDownReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_face_d);
	} else {
		return keyboard_check_released(global.keyboard_face_d);
	}
}

function getInputFaceLeft(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_face_l);
	} else {
		return keyboard_check(global.keyboard_face_l);
	}
}

function getInputFaceLeftPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_face_l);
	} else {
		return keyboard_check_pressed(global.keyboard_face_l);
	}
}

function getInputFaceLeftReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_face_l);
	} else {
		return keyboard_check_released(global.keyboard_face_l);
	}
}

function getInputFaceUp(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_face_u);
	} else {
		return keyboard_check(global.keyboard_face_u);
	}
}

function getInputFaceUpPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_face_u);
	} else {
		return keyboard_check_pressed(global.keyboard_face_u);
	}
}

function getInputFaceUpReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_face_u);
	} else {
		return keyboard_check_released(global.keyboard_face_u);
	}
}

function getInputFaceRight(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_face_r);
	} else {
		return keyboard_check(global.keyboard_face_r);
	}
}

function getInputFaceRightPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_face_r);
	} else {
		return keyboard_check_pressed(global.keyboard_face_r);
	}
}

function getInputFaceRightReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_face_r);
	} else {
		return keyboard_check_released(global.keyboard_face_r);
	}
}

// ====== SHOULDER INPUTS =================================================================================================
function getInputShoulderL(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_shoulder_l);
	} else {
		return keyboard_check(global.keyboard_shoulder_l);
	}
}

function getInputShoulderLPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_shoulder_l);
	} else {
		return keyboard_check_pressed(global.keyboard_shoulder_l);
	}
}

function getInputShoulderLReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_shoulder_l);
	} else {
		return keyboard_check_released(global.keyboard_shoulder_l);
	}
}
	
function getInputShoulderR(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_shoulder_r);
	} else {
		return keyboard_check(global.keyboard_shoulder_r);
	}
}

function getInputShoulderRPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_shoulder_r);
	} else {
		return keyboard_check_pressed(global.keyboard_shoulder_r);
	}
}

function getInputShoulderRReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_shoulder_r);
	} else {
		return keyboard_check_released(global.keyboard_shoulder_r);
	}
}

// ====== START/SELECT INPUTS =================================================================================================
function getInputStart(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_start);
	} else {
		return keyboard_check(global.keyboard_start);
	}
}

function getInputStartPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_start);
	} else {
		return keyboard_check_pressed(global.keyboard_start);
	}
}

function getInputStartReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_start);
	} else {
		return keyboard_check_released(global.keyboard_start);
	}
}
function getInputSelect(){
	if(global.usingJoypad){
		return gamepad_button_check(global.currentJoypadIndex, global.joypad_select);
	} else {
		return keyboard_check(global.keyboard_select);
	}
}

function getInputSelectPressed(){
	if(global.usingJoypad){
		return gamepad_button_check_pressed(global.currentJoypadIndex, global.joypad_select);
	} else {
		return keyboard_check_pressed(global.keyboard_select);
	}
}

function getInputSelectReleased(){
	if(global.usingJoypad){
		return gamepad_button_check_released(global.currentJoypadIndex, global.joypad_select);
	} else {
		return keyboard_check_released(global.keyboard_select);
	}
}