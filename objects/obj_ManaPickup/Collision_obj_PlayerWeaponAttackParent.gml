instance_destroy();
playEffect(snd_PickupMana);
global.player.mp = clamp(global.player.mp + worth, 0, global.player.mpMax);