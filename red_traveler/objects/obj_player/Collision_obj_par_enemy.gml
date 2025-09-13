
if global.levelUp == true {
	
	exit;
}

// sistema de colisao com o inimigo mais dano
if (!invulneravel) {
    global.life -= 1;
    invulneravel = true;
    inv_timer = 60 * 1.5;

    var _push = 6; // força inicial do knockback
    var _dir = point_direction(other.x, other.y, x, y);

    knockback_hspd = lengthdir_x(_push, _dir);
    knockback_vspd = lengthdir_y(_push, _dir);
    knockback_timer = 20; // duração em steps
}

// Knockback (se ativo)
if (knockback_timer > 0) {
    // Movimento eixo X
    if (!place_meeting(x + knockback_hspd, y, obj_all)) {
        x += knockback_hspd;
    } else {
        while (!place_meeting(x + sign(knockback_hspd), y, obj_all)) {
            x += sign(knockback_hspd);
        }
        knockback_hspd = 0; // bateu na parede -> para
    }

    // Movimento eixo Y
    if (!place_meeting(x, y + knockback_vspd, obj_all)) {
        y += knockback_vspd;
    } else {
        while (!place_meeting(x, y + sign(knockback_vspd), obj_all)) {
            y += sign(knockback_vspd);
        }
        knockback_vspd = 0; // bateu na parede -> para
    }

    // Reduz velocidade gradualmente
    knockback_hspd *= 0.85;
    knockback_vspd *= 0.85;

    knockback_timer--;
}
