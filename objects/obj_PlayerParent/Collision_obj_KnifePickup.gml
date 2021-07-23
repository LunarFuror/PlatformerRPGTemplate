instance_destroy(other);
global.player1.weapon = 0;
if(instance_exists(obj_PlayerWeaponInnateParent)){
	instance_destroy(obj_PlayerWeaponInnateParent);
}
instance_create_depth(x, y, global.weaponDepth, obj_PlayerKnifeInnate);
global.gameState.knifeCollected = true;