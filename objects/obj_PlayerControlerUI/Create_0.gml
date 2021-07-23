var _vx = camera_get_view_width(view_camera[0]);
var _vy = camera_get_view_height(view_camera[0]);
display_set_gui_size(_vx, _vy);
draw_set_color(c_white);
depth = DEPTH_UI-2;
sprite_index = -1;

function calculateLowestXp() {
	if(global.player.attackExpCost < global.player.magicExpCost && global.player.attackExpCost < global.player.defenseExpCost){
		lowestXp = global.player.attackExpCost;
	} else if(global.player.defenseExpCost < global.player.magicExpCost && global.player.defenseExpCost < global.player.attackExpCost){
		lowestXp = global.player.defenseExpCost;
	} else if(global.player.magicExpCost < global.player.attackExpCost && global.player.magicExpCost < global.player.defenseExpCost){
		lowestXp = global.player.magicExpCost;
	}
}

calculateLowestXp();