instance_destroy(other);
playEffect(snd_PickupMoney);
global.player.money = clamp(global.player.money + other.worth, 0, global.player.moneyMax);