
// Velocidade do tiro
if global.levelUp == true {
	
	speed = 0;
	exit;
}
else{
	
	var _vel = 2.5;
	speed = _vel;
}

// Efeito do tiro
if alarm[0] <= 0 {
	
	instance_create_layer(x, y, "Instances", obj_power_base_vfx);
	alarm[0] = 3;
}
	