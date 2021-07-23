event_inherited();
///Instantiate Variables

//Set up Menu array
menu = [];
menu[0] = [];
array_push(menu[0],
	{_enabled: true, _value: MENU_BACK, _label: "Back"}
);

function menuBack() {
	closeMenu();
}

function menuInteract() {
	switch(menu[0][mpos]._value){
	    case MENU_BACK:
			menuBack();
	        break;
	}
}

calculateMenuBoundary();