function tile_meeting_precise(_inx, _iny, _layer){
    var _tm = layer_tilemap_get_id(_layer);
    var _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 


	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_inx - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (_iny - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_inx - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (_iny - y));

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
			if(_tile){
				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;
				
				if(_tile == FLAT_WALL_INDEX) return true;
				if(place_meeting(_inx,_iny,_checker)) return true;
			}
		}
	}

	return false;
}

function which_tile_meeting_precise(_inx, _iny, _layer){
    var _tm = layer_tilemap_get_id(_layer);
    var _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 


	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_inx - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (_iny - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_inx - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (_iny - y));

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
			if(_tile){
				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;
				
				if(_tile == FLAT_WALL_INDEX) return FLAT_WALL_INDEX;
				if(place_meeting(_inx,_iny,_checker)) return _tile;
			}
		}
	}

	return 0;
}

function tile_meeting_precise_point(_inx, _iny, _layer){
    var _tm = layer_tilemap_get_id(_layer);
    var _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 


	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_inx - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (_iny - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_inx - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (_iny - y));

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
			if(_tile){
				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;
				
				if(collision_point(_inx,_iny,_checker, true, true)) return true;
			}
		}
	}

	return false;
}

function which_tile_meeting_precise_point(_inx, _iny, _layer){
    var _tm = layer_tilemap_get_id(_layer);
    var _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 


	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_inx - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (_iny - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_inx - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (_iny - y));

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
			if(_tile){
				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;
				
				if(collision_point(_inx,_iny,_checker, true, true)) return _tile;
			}
		}
	}

	return 0;
}

function tile_meeting_top(_inx, _ino, _layer){
    var _tm = layer_tilemap_get_id(_layer);
    var _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 


	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_inx - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top - (_ino)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_inx - x), y),
	    _y2 = _y1;

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
			if(_tile){
				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;
				
				if(_tile == FLAT_WALL_INDEX) return true;
				if(collision_rectangle(bbox_left,bbox_top-_ino,bbox_right, bbox_top-_ino,_checker,false,true)) return true;
			}
		}
	}

	return false;
}

function which_tile_meeting_top(_inx, _ino, _layer){
    var _tm = layer_tilemap_get_id(_layer);
    var _checker = obj_precise_tile_checker;
	if(!instance_exists(_checker)) instance_create_depth(0,0,0,_checker); 


	var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left + (_inx - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top - (_ino)),
	    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (_inx - x), y),
	    _y2 = _y1;

	for(var _x = _x1; _x <= _x2; _x++){
		for(var _y = _y1; _y <= _y2; _y++){
			var _tile = tile_get_index(tilemap_get(_tm, _x, _y));
			if(_tile){
				_checker.x = _x * tilemap_get_tile_width(_tm);
				_checker.y = _y * tilemap_get_tile_height(_tm);
				_checker.image_index = _tile;
				
				if(_tile == FLAT_WALL_INDEX) return _tile;
				if(collision_rectangle(bbox_left,bbox_top-_ino,bbox_right, bbox_top-_ino,_checker,false,true)) return _tile;
			}
		}
	}

	return 0;
}