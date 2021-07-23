function playEffect(soundId){
	audio_play_sound(soundId,0,false);
	audio_sound_gain(soundId,(global.effectVolume/100)*(global.masterVolume/100),0);
}