function scr_divider_flashlight(){
	
var spd = 4;

#region // sistema de Atack (atack base)
power_base_cd--;

if power_base_cd <=0 {
	
	var _inst = instance_create_layer(x, y, "Instances", obj_power_base);
	var _instt = instance_create_layer(obj_power_base.x, obj_power_base.y, "Instances", obj_power_base);
	var _vel = 3;
	
	_inst.speed = _vel;
	_inst.direction = point_direction(x, y, mouse_x, mouse_y);
	
	power_base_cd = power_base_timer;
	if instance_destroy(obj_power_base){
		
		_instt.speed = _vel;
		_instt.direction = point_direction(x, y, mouse_x, mouse_y);
	}
}
#endregion
}