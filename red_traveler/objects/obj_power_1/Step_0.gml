
if global.levelUp == true {
	
	speed = 0;
	exit;
}
else{
	
	speed = 2;
}

// Efeito do tiro
if alarm[0] <= 0 {
	
	instance_create_layer(x, y, "Instances", obj_power_1_vfx);
	alarm[0] = 3;
}
	