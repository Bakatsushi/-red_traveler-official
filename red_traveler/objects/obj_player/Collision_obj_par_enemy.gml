
if global.levelUp == true {
	
	exit;
}

// sistema de colisao com o inimigo mais dano
var _push = 20;

var _dir = point_direction(other.x, other.y, x, y);
var _hspd = lengthdir_x(_push, _dir);
var _vspd = lengthdir_y(_push, _dir);

x += _hspd;
y += _vspd;

if !invulneravel {
    global.life -= 1
    invulneravel = true;
    inv_timer = 60 * 1.5;
}
