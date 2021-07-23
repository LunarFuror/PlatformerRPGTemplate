# Platform RPG Template (GameMaker 2)

Zelda 2 style / Wonder Boy 5 kinda game template.
Includes:
* Overworld map
* Many platformer maps to go to from there that are all currently basic and for testing
* One town, with an example door to go to another platformer map
* A handful of basic enemies to show how to extend the parent objects easily.
* A handful of pickups and powerups to sprinkle about.
* Experience, health, mana, ability, combat, level-up, and menu systems.
* VERY rudimentary save system.
* Character naming system.
* Controlls, audio and gameplay settings. 
   * Audio starts at 50% master because anyone who starts their game settings at full volume is a lunatic in my oppinion. /sarcasmButOnlyKindOf

## Technical Notes/Goals

This is a template project for Gamemaker 2 (min 2.4.2)
Snes-esque resolution 352x240
Snes like controls = dpad start select a b x y l r
Meant to be pixel perfect (no mixels, or upscaled to look pixel based, resolution is actually 352x240)

## From the Creator

My name is Grayson Lorenz, more often known as Lunar.

I'm working on a fan project for the vinesauce community that I figured would make a great base for other people's projects. One big note is that everything in here I wrote by hand, there are no components or things of that nature from the GameMaker market. This is NOT a selling point, if you have a menu system, save system, dialogue system, etc. that you like. You SHOULD use that, and hopefully I've made it easy enough to pull out what is here. My goal is for things here to be modular enough to be replaced, but good enough to be used.

I've tried my best to employ Clean Code and as much SOLID principles I have a grasp of. There are comments throughout to help you see what's going on. There are a couple of notable things that are a little non-standard or hard to find when you jump in here that ultimately made working a little easier.

1. There is a script called "Macros" all macros are there for easy changes. You may find you want to add other macros, I've tried to put as much there as makes sense.
2. There is a global system of variables I'm slowly converting to be json like (structs in gml) those can be found scr_GameSaveFunctions where there are the initializePlayer and initializeGlobals functions.
3. The game is initialized from the object in Objects > System > obj_GlobalState, which is on the room rm_Initialize
4. The object in Objects > System > obj_PlayerControlerUI, runs the ui on the screen but also handles most of the data for the player.
   * This means health, mana, money, keys etc. All of this is done here, not the player
   * The reason for this is it allowed me to treat the 2 player objects for overworld, and platforming as much more seperate things.
   * There is still a player parent for both of those object so that we can do some other nicities, but for the most part, they are their own things.
5. The scripts have as much pulled out as I can, and as much commented as I could after I decided this would be a public project.
6. This project isn't complete until I start full development on the game, at which point I'll push a final update and update this document.
7. Everything included is either hand made by me (tilesets mostly and the blob sprites) which are free to use creative commons, or are open source and their liscneses are included in this project.
   * I've started a credits script to help coordinate this, but cannot gurantee it's up to date for your game, you will need to ensure all proper crediting is done when you use this project.
   * I would like credit for the use of this project.
8. The fonts used in the project are included in "/fontsFiles" for you to install.
9. Currently there's no video settings, so to change the resolution you'll have to futs with rm_Initialize view settings for now.

Good luck, and enjoy!
