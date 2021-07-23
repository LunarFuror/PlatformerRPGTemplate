instance_destroy();
playEffect(snd_PickupHealth);
global.player.hp = clamp(global.player.hp + worth, 0, global.player.hpMax);