if (instance_exists(alvo)) {
    var dist = point_distance(x, y, alvo.x, alvo.y);

    // ---------------- DEFINIÇÃO DE ESTADO ----------------
    if (dist <= raio_visao) {
        if (dist <= 32) { 
            estado = "atacando"; // distância curta → ataque
        } else {
            estado = "perseguindo"; // vê mas está longe → persegue
        }
    }
    else {
        if (estado == "perseguindo" || estado == "atacando") {
            estado = "patrulhando"; // se perder de vista → patrulha
        }
    }

    // ---------------- ESTADOS ----------------
    if (estado == "perseguindo") {
        var dir = point_direction(x, y, alvo.x, alvo.y);

        if (dist > 16) {
            x += lengthdir_x(velocidade, dir);
            y += lengthdir_y(velocidade, dir);
        }

        image_angle = dir + 90;   // ajuste de orientação
        ultimo_angulo = dir;

        sprite_index = spr_move_centitry;
        image_speed = 0.4;
    }

    else if (estado == "patrulhando") {
        var dist_inicio = point_distance(x, y, patrulha_x_inicial, patrulha_y_inicial);

        if (dist_inicio >= patrulha_raio_max) {
            patrulha_angulo = point_direction(x, y, patrulha_x_inicial, patrulha_y_inicial);
        }

        var oldx = x;
        var oldy = y;

        x += lengthdir_x(velocidade * 0.5, patrulha_angulo);
        y += lengthdir_y(velocidade * 0.5, patrulha_angulo);

        // Só gira se realmente se moveu
        if (x != oldx || y != oldy) {
            image_angle = patrulha_angulo + 90;
            ultimo_angulo = patrulha_angulo;
        }

        sprite_index = spr_move_centitry;
        image_speed = 0.4;

        patrulha_tempo--;
        if (patrulha_tempo <= 0) {
            if (irandom(1) == 0) {
                estado = "parado";
                tempo_parado = irandom_range(30, 120);
            } else {
                patrulha_angulo = irandom(359);
                patrulha_tempo = irandom_range(30, 90);
            }
        }
    }

    else if (estado == "parado") {
        sprite_index = spr_centitry;
        image_speed = 0.6;
        

        tempo_parado--;
        if (tempo_parado <= 0) {
            estado = "patrulhando";
            patrulha_angulo = irandom(359);
            patrulha_tempo = irandom_range(30, 90);
        }
    }

   else if (estado == "atacando") {
    sprite_index = spr_attack_centitry;
    image_speed = 0.9;

    // Inverte só pro lado que o player está
    if (alvo.x < x) {
        image_xscale = -1; // olhando pra esquerda
    } else {
        image_xscale = 1;  // olhando pra direita
    }

    // mantém o inimigo de frente (sem girar o sprite)
    image_angle = 0;  

    // Criação da hitbox (continua indo na direção correta)
    if (floor(image_index) == 2 && !ja_atacou) {
        var dist_ataque = 24;
        var dir = point_direction(x, y, alvo.x, alvo.y);
        var hx = x + lengthdir_x(dist_ataque, dir);
        var hy = y + lengthdir_y(dist_ataque, dir);

        instance_create_layer(hx, hy, "Instances", attack_centitry);
        ja_atacou = true;
    }

    if (image_index >= image_number - 1) {
        image_index = 0;
        estado = "perseguindo";
        ja_atacou = false;
    }
}

}
