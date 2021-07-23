event_inherited();

// ===== FLICKER =========================================================
if(liveTime > 0) { liveTime --; } else { instance_destroy(); }

if(liveTime < 300 && liveTime%6 == 0){
	image_alpha = 0;	
} else if(liveTime < 150 && liveTime%3 == 0){
	image_alpha = 0;	
} else {
	image_alpha = 1;	
}