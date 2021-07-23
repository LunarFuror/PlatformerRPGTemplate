instance_destroy(other);
playEffect(snd_PickupHealth);
global.player.hp = clamp(global.player.hp + other.worth, 0, global.player.hpMax);