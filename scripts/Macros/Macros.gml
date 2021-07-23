#macro CAMERA_HEIGHT 240
#macro CAMERA_WIDTH 352
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START rm_StartScreen
#macro OVERWORLD_ROOM rm_TestingTopDown
#macro FONT_SPEED .75
#macro PADDING 10
#macro CAMERA_PAN_TIME 120
#macro SPAWN_DISTANCE 240
#macro HIT_SPEED_INCREASE 1.5
#macro DUST_TIME_MAX 7
#macro GRAVITY .25
#macro ENEMY_I_TIME 30

#macro FIRST_SLOPE_INDEX 5
#macro FLAT_WALL_INDEX 1

// Layer Macros
#macro DEPTH_TRANSITION -10000
#macro DEPTH_UI -9001
#macro DEPTH_FOREGROUND -4000
#macro DEPTH_WEAPON -3050
#macro DEPTH_PLAYER -3000
#macro DEPTH_ENEMY -2000
#macro DEPTH_OBJECT -1000
#macro DEPTH_GROUND 0
#macro DEPTH_BACKGROUND 100
#macro DEPTH_BOTTOM 9001

// Interactable macros
#macro I_SHOW_MESSAGE 1
#macro I_GIVE_MONEY 2
#macro I_GIVE_KEYS 3
#macro I_GIVE_HEALTH 4
#macro I_GIVE_MANA 5
#macro I_GIVE_ITEMS 6
#macro I_GIVE_EXPERIENCE 7
#macro I_MOVE_ROOM 8

// Menu Macros
#macro MENU_BACK -1
#macro PAUSE_INVENTORY 0
#macro PAUSE_SAVE 1
#macro START_SAVE_1 2
#macro START_SAVE_2 3
#macro START_SAVE_3 4
#macro START_DELETE 5
#macro MAIN_START 6
#macro MAIN_OPTIONS 7
#macro OPTIONS_CONTROLS 8
#macro OPTIONS_GAMEPLAY 9
#macro OPTIONS_VIDEO 10
#macro OPTIONS_SOUND 11
#macro CONTROLS_GAMEPAD 12
#macro CONTROLS_ACCEPT 13
#macro SOUND_MASTER 14
#macro SOUND_MUSIC 15
#macro SOUND_EFFECTS 16
#macro SOUND_ACCEPT 17
#macro CONTROLLS_INPUT 18
#macro CONTROLLS_ACCEPT 19
#macro PAUSE_QUIT 20
#macro GAME_OVER_CONTINUE 21
#macro PAUSE_STATS 22
#macro PAUSE_LEVEL_UP 23
#macro LEVEL_UP_ATTACK 24
#macro LEVEL_UP_DEFENSE 25
#macro LEVEL_UP_MAGIC 26

// Biome Macros
#macro ROAD 0
#macro GRASS 1
#macro FOREST 2
#macro SAND 3
#macro WATER 4
#macro SWAMP 5
#macro MOUNTAIN 6
#macro GRAVES 7
#macro WASTELAND 8

// Transition Macros
#macro FADE_IN 0
#macro FADE_OUT 1

#macro FADE_FAST .5
#macro FADE_MEDIUM 1
#macro FADE_SLOW 2

#macro FADE_CONSISTENT 2
#macro FADE_CENTER 3
#macro FADE_OUTWARD 4
#macro FADE_FROM_RIGHT 5
#macro FADE_FROM_LEFT 6

// Style Macros
#macro MESSAGE_STYLE 0
#macro CHAT_STYLE 1
#macro MENU_STYLE 2

// Player Macros
#macro LEVEL_MAX 10
#macro MAX_EXPERIENCE 99999
#macro MAX_CROUCH_SPEED 1
#macro MAX_WALK_SPEED 2
#macro HEALTH_DANGER_THRESHOLD 3

#macro KNIFE 0
#macro SWORD 1

#macro VINESHROOM 0
#macro SCOOT 1
#macro MEAT 2
#macro CHAT 3

// Player States
#macro GROUNDED_STATE 0
#macro MIDAIR_STATE 1

// Music States
#macro MUSIC_STOPPED 0
#macro MUSIC_FADE_IN 1
#macro MUSIC_FADE_OUT 2
#macro MUSIC_PLAYING 3

// Villager Macros
#macro MALE_VILLAGER_1 spr_VillagerMale1
#macro FEMALE_VILLAGER_1 spr_VillagerFemale1
#macro CHILD_VILLAGER_1 spr_VillagerChild1
#macro OLD_MALE_VILLAGER_1 spr_VillagerMaleOld1

#macro VILLAGER_MOVING 0
#macro VILLAGER_WAITING 1