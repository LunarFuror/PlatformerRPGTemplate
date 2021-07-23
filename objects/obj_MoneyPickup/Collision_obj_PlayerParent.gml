instance_destroy();
playEffect(snd_PickupMoney);
global.player.money = clamp(global.player.money + worth, 0, global.player.moneyMax);