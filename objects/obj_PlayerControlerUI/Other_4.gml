calculateLowestXp();

if( instance_exists(obj_PlayerParent) && global.player.hp <= HEALTH_DANGER_THRESHOLD ){
	playEffect(snd_HealthDanger);
}