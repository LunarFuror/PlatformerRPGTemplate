instance_destroy(other);
playEffect(snd_PickupMana);
global.player1.mp = clamp(global.player1.mp + other.worth, 0, global.player1.mpMax);