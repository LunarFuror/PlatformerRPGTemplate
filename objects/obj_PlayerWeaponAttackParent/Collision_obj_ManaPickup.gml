instance_destroy(other);
playEffect(snd_PickupMana);
global.player.mp = clamp(global.player.mp + other.worth, 0, global.player.mpMax);