function drawSpriteText(_x, _y, _string){
	//optional parameters, at time of writing this is how to do it :/
	var color = argument_count > 3 ? argument[3] : c_white;
	var _offsetX = 0;
	var _offsetY = 0;
	for(var i = 1; i <= string_length(_string); i++){
	    var c;
	    c = ord(string_char_at(_string, i));
    
	    if(global._charMap[c] != -1){
	        draw_sprite_ext(spr_MainFont, global._charMap[c]-1, _x + _offsetX, _y + _offsetY, 1, 1, 0, color, 1);
	    }
	    _offsetX += sprite_get_width(spr_MainFont);
    
	    if(string_char_at(_string, i) == "#"){
	        _offsetX = 0;
	        _offsetY += sprite_get_height(spr_MainFont);
	    }
	}
}

function getButtonString(_thisKey) {
	if(!global.usingJoypad){
		switch(_thisKey){
		    case vk_up: return "up";
		        break;
		    case vk_down: return "down";
		        break;
		    case vk_left: return "left";
		        break;
		    case vk_right: return "right";
		        break;
		    case vk_space: return "space";
		        break;
		    case vk_backspace: return "bksp";
		        break;
		    case vk_lalt: return "l.alt";
		        break;
		    case vk_lcontrol: return "l.ctrl";
		        break;
		    case vk_control: return "ctrl";
		        break;
		    case vk_lshift: return "l.shift";
		        break;
		    case vk_ralt: return "r.alt";
		        break;
		    case vk_rcontrol: return "r.ctrl";
		        break;
		    case vk_rshift: return "r.shift";
		        break;
		    case vk_end: return "end";
		        break;
		    case vk_home: return "home";
		        break;
		    case vk_pageup: return "pg up";
		        break;
		    case vk_pagedown: return "pg dn";
		        break;
		    case vk_insert: return "insert";
		        break;
		    case vk_enter: return "enter";
		        break;
		    case vk_escape: return "esc";
		        break;
		    case vk_delete: return "del";
		        break;
		    case vk_tab: return "tab";
		        break;
		    case vk_f1: return "f1";
		        break;
		    case vk_f2: return "f2";
		        break;
		    case vk_f3: return "f3";
		        break;
		    case vk_f4: return "f4";
		        break;
		    case vk_f5: return "f5";
		        break;
		    case vk_f6: return "f6";
		        break;
		    case vk_f7: return "f7";
		        break;
		    case vk_f8: return "f8";
		        break;
		    case vk_f9: return "f9";
		        break;
		    case vk_f10: return "f10";
		        break;
		    case vk_f11: return "f11";
		        break;
		    case vk_f12: return "f12";
		        break;
		    default: return chr(_thisKey);
		        break;
		}
	} else {
		switch(_thisKey){
			//there is likely a better way to do this, but for now this will do
			case gp_padr: return "right";
		        break;
		    case gp_padl: return "left";
		        break;
		    case gp_padu: return "up";
		        break;
		    case gp_padd: return "down";
		        break;
		    case gp_face1: return "btn 1";
		        break;
		    case gp_face2: return "btn 2";
		        break;
		    case gp_face3: return "btn 3";
		        break;
		    case gp_face4: return "btn 4";
		        break;
		    case gp_shoulderl: return "L";
		        break;
		    case gp_shoulderr: return "R";
		        break;
		    case gp_start: return "start";
		        break;
		    case gp_select: return "select";
		        break;
			case 32788: return "up";
				break;
			case gp_shoulderlb: return "L Trigger"
				break;
			case gp_shoulderrb: return "R Trigger"
				break;
			default: return string(_thisKey);
			    break;
		}
	}
}
	
function drawFramedDetailBox(_spriteIndex, _x1, _y1, _x2, _y2){
	var _size = sprite_get_width(spr_TextFrameDetailed) / 3;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;
	var _columns = _w div _size;
	var _rows = _h div _size;
	
	//middle ==============================================
	for(var i = 1; i < _rows; i ++){
		for(var j = 1; j < _columns; j ++){
			draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, _size, _size, _size, _size, _x1+(_size*j), _y1+(_size*i));
		}
	}	
	
	
	//corners ==============================================
	//TL
	draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, 0, 0, _size, _size, _x1, _y1);
	//TR
	draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, _size*2, 0, _size, _size, _x1+(_columns*_size), _y1);
	//BL
	draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, 0, _size*2, _size, _size, _x1, _y1+(_rows*_size));
	//BR
	draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, _size*2, _size*2, _size, _size, _x1+(_columns*_size), _y1+(_rows*_size));
	
	
	//edges ==============================================
	for(var i = 1; i < _columns; i ++){
		//T
		draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, _size, 0, _size, _size, _x1+(_size*i), _y1);
		//B
		draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, _size, _size*2, _size, _size, _x1+(_size*i), _y1+(_rows*_size));
	}
	for(var i = 1; i < _rows; i ++){
		//L
		draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, 0, _size, _size, _size, _x1, _y1+(_size*i));
		//R
		draw_sprite_part(spr_TextFrameDetailed, _spriteIndex, _size*2, _size, _size, _size, _x1+(_columns*_size), _y1+(_size*i));
	}
	
}

function drawFramedSimpleBox(_spriteIndex, _x1, _y1, _x2, _y2){
	var _size = sprite_get_width(spr_TextFrameSimple) / 3;
	var _w = _x2 - _x1;
	var _h = _y2 - _y1;
	
	//middle ==============================================
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, _size, _size, 1, 1, _x1+_size, _y1+_size,_w-(_size*2),_h-(_size*2), c_white,1);	
	
	
	//corners ==============================================
	//TL
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, 0, 0, _size, _size, _x1, _y1,1,1,c_white,1);
	//TR
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, _size*2, 0, _size, _size, _x2-_size, _y1,1,1,c_white,1);
	//BL
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, 0, _size*2, _size, _size, _x1, _y2-_size,1,1,c_white,1);
	//BR
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, _size*2, _size*2, _size, _size, _x2-_size, _y2-_size,1,1,c_white,1);
	
	
	//edges ==============================================
	//T
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, _size, 0, 1, _size, _x1+_size, _y1,_w-(_size*2),1,c_white,1);
	//B
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, _size, _size*2, 1, _size, _x1+_size, _y2-_size,_w-(_size*2),1,c_white,1);
	//L
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, 0, _size, _size, 1, _x1, _y1+_size,1,_h-(_size*2),c_white,1);
	//R
	draw_sprite_part_ext(spr_TextFrameSimple, _spriteIndex, _size*2, _size, _size, 1, _x2-_size, _y1+_size,1,_h-(_size*2),c_white,1);
	
}

function setDrawText(_font, _hAlign, _vAlign, _color){
	draw_set_font(_font);
	draw_set_halign(_hAlign);
	draw_set_valign(_vAlign);
	draw_set_color(_color);
}

function newTextBox(_content){
	var _obj;
	//optional parameters. At time of writing, this is how to do it :/
	var _frame = argument_count > 1 ? argument[1] : 0;
	var _font = argument_count > 2 ? argument[2] : fnt_Menu;
	
	if(instance_exists(obj_TextBox)){
		_obj = obj_TextBoxQueued;
	} else {
		_obj = obj_TextBox;	
	}
	
	with(instance_create_depth(0,0,	DEPTH_UI-100, _obj)){
		content = _content;
		style = _frame;
		font = _font;
	}
	global.gamePaused = true;
}

function string_split(_string, _delimiter) {
	var _returnArray = [];
	
	if( string_length(_string) > 0 && string_length(_string) > 0 && string_pos_ext(_delimiter, _string, 1) != 0 ){
		var _nextPosition = string_pos_ext(_delimiter, _string, 1);
		var _strStart = 1;
		var _finalLoop = false;
		while ( _nextPosition != -1 ){
			var _strLength = _nextPosition - _strStart;
			var _strPiece = string_copy(_string, _strStart, _strLength);
			array_push(_returnArray, _strPiece);
		
			_nextPosition ++;
			_strStart = _nextPosition;
			if( string_pos_ext(_delimiter, _string, _strStart) != 0 ) { // delimiter found
				_nextPosition = string_pos_ext(_delimiter, _string, _strStart);
			} else if ( !_finalLoop ) { // delimiter not found, and haven't done the last string
				_finalLoop = true;
				_nextPosition = string_length(_string)+1;
			} else { // done
				_nextPosition = -1;	
			}
		}
	} else {
		array_push(_returnArray, _string);
	}
	return _returnArray;
}