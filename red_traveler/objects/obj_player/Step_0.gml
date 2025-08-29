
if global.levelUp == true {
	
	exit;
}

#region // movimentação do personagem
var _right = keyboard_check(ord("D")) or keyboard_check(vk_right);
var _left = keyboard_check(ord("A")) or keyboard_check(vk_left);
var _up = keyboard_check(ord("W")) or keyboard_check(vk_up);
var _down = keyboard_check(ord("S")) or keyboard_check(vk_down);

var _xx = _right - _left;
var _yy = _down - _up;

if _xx != 0 or _yy != 0 {
    
    sprite_index = spr_player_walking;

    dir = point_direction(x, y, x + _xx, y + _yy);
    hspd = lengthdir_x(spd, dir);
    vspd = lengthdir_y(spd, dir);

    x += hspd;
    y += vspd;
    
    if (_xx > 0) {
        image_xscale = 1;
    }
    else if (_xx < 0) {
        image_xscale = -1;
    }

} else {
    sprite_index = spr_player_idle;
}
#endregion

#region // sistema de Atack
power_1_cd--;

if power_1_cd <=0 {
	
	var _inst = instance_create_layer(x, y, "Instances", obj_power_1);
	
	_inst.speed = 3;
	_inst.direction = point_direction(x, y, mouse_x, mouse_y);
	
	power_1_cd = power_1_timer;
}
#endregion
