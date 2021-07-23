instance_destroy();
global.player.weapon = SWORD;
if(instance_exists(obj_PlayerWeaponInnateParent)){
	instance_destroy(obj_PlayerWeaponInnateParent);
}
instance_create_depth(x, y, DEPTH_WEAPON, obj_PlayerSwordInnate);
global.gameState.swordCollected = true;