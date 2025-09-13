
if global.levelUp == true {
	
	exit;
}

image_angle = point_direction(x, y, mouse_x, mouse_y);

var spd = 4;

var alvo_x = obj_player.x - 18;
var alvo_y = obj_player.y - 21;

// Mover suavemente para a posição alvo
x = lerp(x, alvo_x, 0.13);
y = lerp(y, alvo_y, 0.13);

#region // sistema de Atack (atack base)
power_base_cd--;

if (power_base_cd <= 0) {
   
    var _inst = instance_create_layer(x, y, "Instances", obj_power_base);
    var _vel = 3;
    
    _inst.speed = _vel;
    _inst.direction = point_direction(x, y, mouse_x, mouse_y);
    
    sprite_index = spr_gun_shot;
    
    shoot_anim_timer = 12;
    
    power_base_cd = power_base_timer;
}
else {
    if (shoot_anim_timer >= 0) {
        shoot_anim_timer -= 1;
        sprite_index = spr_gun_shot;
    } else {
        sprite_index = spr_gun_base;
    }
}
#endregion
