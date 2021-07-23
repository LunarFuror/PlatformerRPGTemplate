// TODO: Clean this mess up, pull magic numbers into proper variables.
if(showUi){
	// draw ability ===========================================================================
	draw_sprite(spr_AbilityFrame, 0, 2, 2);
	if(global.player.ability != -1){
		draw_sprite(spr_CurrentAbility, global.player.ability, 6, 6);
	}
		
	// draw MP ===========================================================================
	var mpXOffset = 4;
	var mpYOffset = 19;
	var mpBarHeight = 6;
	var mpFullBars = max(floor((global.player.mp-1)/5), 0);
	var mpEmptyBars = max(floor((global.player.mpMax-global.player.mp)/5), 0);
	var mpLastY = mpYOffset;
		
	draw_sprite(spr_MagicBarTop, 0, mpXOffset, mpLastY);
	mpLastY += mpBarHeight;
		
	for(var i = 0; i < mpEmptyBars; i++){
		draw_sprite(spr_MagicBar, 0, mpXOffset, mpLastY);
		mpLastY += mpBarHeight;
	}
	
	if(global.player.mp >= 1){ // if we have mana draw the partial bar
		draw_sprite(spr_MagicBar, (global.player.mp-1)%5+1, mpXOffset, mpLastY);
		mpLastY += mpBarHeight;
	}
		
	for(var i = 0; i < mpFullBars; i++){
		draw_sprite(spr_MagicBar, 5, mpXOffset, mpLastY);
		mpLastY += mpBarHeight;
	}
		
	draw_sprite(spr_MagicBarBottom, 0, mpXOffset, mpLastY);
	
	// draw HP ===========================================================================
	var hpXOffset = 19;
	var hpYOffset = 12;
	var hpBarWidth = 16;
	var hpFullBars = floor((global.player.hp-1)/8); // at 23 of 24 this should be 2
	var hpEmptyBars = floor((global.player.hpMax-global.player.hp)/8); // at 16 of 24 this should be 1
	
	var hpLastX = hpXOffset;
		
	for(var i = 0; i < hpFullBars; i++){
		draw_sprite(spr_HealthBar, 8, hpLastX, hpYOffset);
		hpLastX += hpBarWidth/2;
	}
		
	var tempX = hpLastX; //store our current place
	hpLastX += hpBarWidth/2; // skip for now
		
	for(var i = 0; i < hpEmptyBars; i++){
		draw_sprite(spr_HealthBar, 0, hpLastX, hpYOffset);
		hpLastX += hpBarWidth/2;
	}
	
	// draw what we skipped
	draw_sprite(spr_HealthBar, (global.player.hp-1)%8+1, tempX, hpYOffset);
		
    //drawKeys ===========================================================================
	var uiXOffset = 19;
	var uiYOffset = 2;
	var uiWidth = 8;
	var fontWidth = 8;
	var uiGap = 2;
	var uiBigGap = 8;
		
	var keyTextXOffset = uiXOffset + uiWidth + uiGap;
	var moneySpriteXOffset = keyTextXOffset + (2*fontWidth) + uiBigGap;
	var moneyTextXOffset = moneySpriteXOffset + uiWidth + uiGap;
	var xpSpriteXOffset = moneyTextXOffset + (4*fontWidth) + uiBigGap;
	var xpTextXOffset = xpSpriteXOffset + uiWidth + uiGap;
	draw_sprite(spr_Keys, 0, uiXOffset, uiYOffset);
	drawSpriteText(keyTextXOffset, uiYOffset, string(global.player.keys));
	
    //drawMoney ===========================================================================
	draw_sprite(spr_Money, 0, moneySpriteXOffset, uiYOffset);
	if( global.player.money < global.player.moneyMax){
		drawSpriteText(moneyTextXOffset, uiYOffset, string(global.player.money));
	} else {
		drawSpriteText(moneyTextXOffset, uiYOffset, string(global.player.money), c_lime);
	}
	
	//draw XP ===========================================================================
	if(global.player.experience >= lowestXp){
		draw_sprite_ext(spr_Experience, 0, xpSpriteXOffset, uiYOffset,1,1,0, c_lime,1);
		drawSpriteText(xpTextXOffset, uiYOffset, string(global.player.experience), c_lime);
	} else {
		draw_sprite(spr_Experience, 0, xpSpriteXOffset, uiYOffset)
		drawSpriteText(xpTextXOffset, uiYOffset, string(global.player.experience));
	}
}