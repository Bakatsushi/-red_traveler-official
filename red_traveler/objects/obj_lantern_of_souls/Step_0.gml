
if global.levelUp == true {
	
	exit;
}

// Velocidade que o companheiro ajusta a posição
var spd = 4;

var alvo_x = obj_player.x + 16;
var alvo_y = obj_player.y - 26;

// Mover suavemente para a posição alvo
x = lerp(x, alvo_x, 0.13);
y = lerp(y, alvo_y, 0.13);

if global.level == 2{
	
	power_base_cd--;

	if power_base_cd <=0 {
	
		var _inst = instance_create_layer(x, y, "Instances", obj_power_base);
		var _instt = instance_create_layer(obj_power_base.x, obj_power_base.y, "Instances", obj_power_base);
		var _vel = 3;
	
		_inst.speed = _vel;
		_inst.direction = point_direction(x, y, mouse_x, mouse_y);
	
		if instance_destroy(obj_power_base){
		
		_instt.speed = _vel;
		_instt.direction = point_direction(x, y, mouse_x, mouse_y);
		}
		power_base_cd = power_base_timer;
	}
	exit;
}

#region // sistema de Atack (atack base)
power_base_cd--;

if power_base_cd <=0 {
	
	var _inst = instance_create_layer(x, y, "Instances", obj_power_base);
	var _vel = 3;
	
	_inst.speed = _vel;
	_inst.direction = point_direction(x, y, mouse_x, mouse_y);
	
	power_base_cd = power_base_timer;
}
#endregion
