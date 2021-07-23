Zelda 2 style / Wonder Boy 5 kinda game

==== Technical Notes ====

This is a template project for Gamemaker 2 (min 2.4.2)
Snes-esque resolution 352x240
Snes like controls = dpad start select a b x y l r

==== From the Creator ====

My name is Grayson Lorenz, more often known as Lunar.

I'm working on a fan project for the vinesauce community that 
I figured would make a great base for other people's projects.

I've tried my best to employ Clean Code and as much SOLID principles I have a grasp of.
There are comments throughout to help you see what's going on. There are a couple of notable things that are
a little non-standard or hard to find when you jump in here that ultimately made working a little easier.

1. There is a script called "Macros" all macros are there for easy changes. You may find you want to add other macros, I've tried to put as much there as makes sense.
2. There is a global system of variables I'm slowly converting to be json like (structs in gml) those can be found scr_GameSaveFunctions where there are the initializePlayer and initializeGlobals functions.
3. The game is initialized from the object in Objects > System > obj_GlobalState, which is on the room rm_Initialize
4. The object in Objects > System > obj_PlayerControlerUI, runs the ui on the screen but also handles most of the data for the player.
	a. This means health, mana, money, keys etc. All of this is done here, not the player
	b. The reason for this is it allowed me to treat the 2 player objects for overworld, and platforming as much more seperate things.
	c. There is still a player parent for both of those object so that we can do some other nicities, but for the most part, they are their own things.
5. The scripts have as much pulled out as I can, and as much commented as I could after I decided this would be a public project.
6. This project isn't complete until I start full development on the game, at which point I'll push a final update and update this document.
7. Everything included is either hand made by me (tilesets mostly and the blob sprites) which are free to use creative commons, or are open source and their liscneses are included in this project.
	a. I've started a credits script to help coordinate this, but cannot gurantee it's up to date for your game, you will need to ensure all proper crediting is done when you use this project.
	b. I would like credit for the use of this project.
8. Good luck, and enjoy!