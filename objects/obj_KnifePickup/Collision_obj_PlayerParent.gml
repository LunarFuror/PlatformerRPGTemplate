instance_destroy();
global.player.weapon = KNIFE;
if(instance_exists(obj_PlayerWeaponInnateParent)){
	instance_destroy(obj_PlayerWeaponInnateParent);
}
var knife = instance_create_depth(obj_PlayerParent.x, obj_PlayerParent.y, DEPTH_WEAPON, obj_PlayerKnifeInnate);
knife.image_xscale = obj_PlayerParent.image_xscale;
global.gameState.knifeCollected = true;
newTextBox("Got yourself a\npokin device!\n\nTHRUST it with the\nattack button!", 3, fnt_Message);