function saveSettings(){
	if(file_exists("settings.sav")) file_delete("settings.sav");
	//Create and open save file
	ini_open("settings.sav");

	//AUDIO/VIDEO
	ini_write_real("Sound","masterVolume",global.masterVolume);
	ini_write_real("Sound","musicVolume",global.musicVolume);
	ini_write_real("Sound","effectVolume",global.effectVolume);
	ini_write_real("Video","fullscreen",global.fullscreen);
	ini_write_real("Video","resolution",global.resolution);

	//CONTROLS
	ini_write_real("Controlls","right",global.keyboard_right);
	ini_write_real("Controlls","left",global.keyboard_left);
	ini_write_real("Controlls","up",global.keyboard_up);
	ini_write_real("Controlls","down",global.keyboard_down);
	ini_write_real("Controlls","button1",global.keyboard_face_d);
	ini_write_real("Controlls","button2",global.keyboard_face_l);
	ini_write_real("Controlls","button3",global.keyboard_face_u);
	ini_write_real("Controlls","button4",global.keyboard_face_r);
	ini_write_real("Controlls","button5",global.keyboard_shoulder_l);
	ini_write_real("Controlls","button6",global.keyboard_shoulder_r);
	ini_write_real("Controlls","button7",global.keyboard_start);
	ini_write_real("Controlls","button8",global.keyboard_select);

	ini_write_real("Controlls","jpright",global.joypad_right);
	ini_write_real("Controlls","jpleft",global.joypad_left);
	ini_write_real("Controlls","jpup",global.joypad_up);
	ini_write_real("Controlls","jpdown",global.joypad_down);
	ini_write_real("Controlls","jpbutton1",global.joypad_face_d);
	ini_write_real("Controlls","jpbutton2",global.joypad_face_l);
	ini_write_real("Controlls","jpbutton3",global.joypad_face_u);
	ini_write_real("Controlls","jpbutton4",global.joypad_face_r);
	ini_write_real("Controlls","jpbutton5",global.joypad_shoulder_l);
	ini_write_real("Controlls","jpbutton6",global.joypad_shoulder_r);
	ini_write_real("Controlls","jpbutton7",global.joypad_start);
	ini_write_real("Controlls","jpbutton8",global.joypad_select);

	//GAMEPLAY STUFF
	ini_write_real("Other","usingJoypad",global.usingJoypad);

	//close and save the file
	ini_close();
}

function loadSettings(){
	if(file_exists("settings.sav")){
	    //Open save file
	    ini_open("settings.sav");
    
	    //AUDIO/VIDEO
	    global.masterVolume = real(ini_read_string("Sound","masterVolume","50"));
	    global.musicVolume = real(ini_read_string("Sound","musicVolume","100"));
	    global.effectVolume = real(ini_read_string("Sound","effectVolume","100"));
	    global.fullscreen = real(ini_read_string("Video","fullscreen","0"));
	    global.resolution = real(ini_read_string("Video","resolution","0"));
    
	    //CONTROLS
	    global.keyboard_right = real(ini_read_string("Controlls","right","39"));
	    global.keyboard_left = real(ini_read_string("Controlls","left","37"));
	    global.keyboard_up = real(ini_read_string("Controlls","up","38"));
	    global.keyboard_down = real(ini_read_string("Controlls","down","40"));
	    global.keyboard_face_d = real(ini_read_string("Controlls","button1","90"));
	    global.keyboard_face_l = real(ini_read_string("Controlls","button2","88"));
	    global.keyboard_face_u = real(ini_read_string("Controlls","button3","67"));
	    global.keyboard_face_r = real(ini_read_string("Controlls","button4","65"));
	    global.keyboard_shoulder_l = real(ini_read_string("Controlls","button5","83"));
	    global.keyboard_shoulder_r = real(ini_read_string("Controlls","button6","68"));
	    global.keyboard_start = real(ini_read_string("Controlls","button7","13"));
	    global.keyboard_select = real(ini_read_string("Controlls","button8","163"));
    
	    global.joypad_right = real(ini_read_string("Controlls","jpright","32784"));
	    global.joypad_left = real(ini_read_string("Controlls","jpleft","32783"));
	    global.joypad_up = real(ini_read_string("Controlls","jpup","32781"));
	    global.joypad_down = real(ini_read_string("Controlls","jpdown","32782"));
	    global.joypad_face_d = real(ini_read_string("Controlls","jpbutton1","32769"));
	    global.joypad_face_l = real(ini_read_string("Controlls","jpbutton2","32771"));
	    global.joypad_face_u = real(ini_read_string("Controlls","jpbutton3","32770"));
	    global.joypad_face_r = real(ini_read_string("Controlls","jpbutton4","32772"));
	    global.joypad_shoulder_l = real(ini_read_string("Controlls","jpbutton5","32773"));
	    global.joypad_shoulder_r = real(ini_read_string("Controlls","jpbutton6","32774"));
	    global.joypad_start = real(ini_read_string("Controlls","jpbutton7","32778"));
	    global.joypad_select = real(ini_read_string("Controlls","jpbutton8","32777"));
    
	    //GAMEPLAY STUFF
		//only load the joypad if we detect a joypad
		var detectedJoypad = detectConnectedJoypad();
		if(detectedJoypad == -1){
			global.usingJoypad = 0;
			global.currentJoypadIndex = -1;
		} else {
			global.usingJoypad = real(ini_read_string("Other","usingJoypad","0"));
		}
    
	    //close file
	    ini_close();
	}
	else{
	    saveSettings();
	}
}