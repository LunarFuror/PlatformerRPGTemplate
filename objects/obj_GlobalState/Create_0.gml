randomize(); //set random seed

initializeGlobals();
initializePlayer();					 

//Load settings file if it exists, create it if it doesn't.
loadSettings();
surface_resize(application_surface, CAMERA_WIDTH, CAMERA_HEIGHT);
transitionRoom(ROOM_START, FADE_FAST, mus_MainTheme, FADE_CONSISTENT, false, -1, -1, -1);