var musicChanged = prevRoomSound != global.gameState.roomSound;

switch(state){
	case MUSIC_PLAYING:
		if(musicChanged){
			state = MUSIC_FADE_OUT;
			audio_sound_gain(prevRoomSound, 0, fadeTime*1000);// start the fadeout
		}
		break;
	case MUSIC_FADE_OUT:
		fadeProgress = clamp(fadeProgress + 1/(fadeTime * game_get_speed(gamespeed_fps)), 0, 1);
		
		if(fadeProgress = 1){
			state = MUSIC_STOPPED;
			fadeProgress = 0;
		}
		break;
	case MUSIC_STOPPED:
		audio_stop_sound(prevRoomSound);
		prevRoomSound = global.gameState.roomSound; // switchover occurs here
		
		audio_play_sound(global.gameState.roomSound, 0, true); // start new music
		audio_sound_gain(global.gameState.roomSound, (global.musicVolume/100)*(global.masterVolume/100), 0);
		
		state = MUSIC_PLAYING;
		break;
}