if (instance_exists(alvo)) {
    var dist = point_distance(x, y, alvo.x, alvo.y);

    switch (estado) {
        case "patrulhando":
            x += lengthdir_x(velocidade, patrulha_angulo);
            y += lengthdir_y(velocidade, patrulha_angulo);

            patrulha_tempo--;
            if (patrulha_tempo <= 0) {
                patrulha_angulo = irandom(359);
                patrulha_tempo = irandom_range(30, 90);
            }

            if (dist <= raio_visao) estado = "perseguindo";
        break;

        case "perseguindo":
            var dir = point_direction(x, y, alvo.x, alvo.y);
            x += lengthdir_x(velocidade, dir);
            y += lengthdir_y(velocidade, dir);

            if (dist > raio_visao * 1.5) estado = "patrulhando";

            if (dist < 150 && !ja_atacou) {
                estado = "preparando_ataque";
                sprite_index = spr_attack_goletrizy;
                image_index = 0;
                image_speed = 0.6; // velocidade aumentada da animação
            }
        break;

        case "preparando_ataque":
            // Dispara os projéteis quando chegar no frame 5
            if (image_index >= 5 && !ja_atacou) {
                var dirs = [0, 180, 45, 135, -45, -135];
                for (var i = 0; i < array_length(dirs); i++) {
                    var d = dirs[i];
                    var p = instance_create_layer(x, y, "Instances", attack_goletrizy);
                    p.direcao = d;
                    p.image_angle = d - 45;
                    p.velocidade = 3;
                }
                ja_atacou = true;
                alarm[0] = 40; // cooldown
            }

            // Quando a animação termina, volta a perseguir
            if (image_index >= image_number - 1) {
                estado = "perseguindo";
                sprite_index = spr_goletrizy;
                image_speed = 1;
                ja_atacou = false; // opcional: permite atacar novamente depois
            }
        break;
    }
}
