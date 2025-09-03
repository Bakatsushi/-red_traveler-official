
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

} 
else {
    sprite_index = spr_player_idle;
}

#endregion

#region // Controla invulnerabilidade
if invulneravel {
    inv_timer--;
    if (inv_timer <= 0) {
        invulneravel = false;
    }
}

if invulneravel {
    var blink_on = ((inv_timer div 7) mod 2) == 0;
    image_alpha = blink_on ? 1 : 0.25;
} else {
    image_alpha = 1;
}
#endregion
