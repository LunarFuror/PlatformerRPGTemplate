function easeOutCurve(t){
	return sin(t * pi * 0.5);
}

function easeInCurve(t){
	return 1 - cos(t * pi * .5);
}

function exponentialCurve(t){
	return t * t;
}

function easeInOutCurve(t){
	return t * t * t * (t * (6 * t -15) + 10);
}