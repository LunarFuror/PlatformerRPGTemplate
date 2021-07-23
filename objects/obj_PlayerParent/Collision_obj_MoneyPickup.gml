instance_destroy(other);
playEffect(snd_PickupMoney);
global.player1.money = clamp(global.player1.money + other.worth, 0, global.player1.moneyMax);