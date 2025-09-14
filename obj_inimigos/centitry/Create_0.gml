// Velocidade de movimento
velocidade = 1;

// Vida
vida = 10;
vida_max = 10;

// Alcance de detecção (pixels)
raio_visao = 100;

// Referência ao player
alvo = player;

// Estado inicial
estado = "patrulhando"; 
// possíveis: "patrulhando", "parado", "perseguindo"

// Posição inicial
patrulha_x_inicial = x;
patrulha_y_inicial = y;
patrulha_raio_max = 60; // limite da patrulha

patrulha_angulo = irandom(359);
patrulha_tempo = irandom_range(30, 90); // steps até mudar de direção

// Timer de ficar parado
tempo_parado = 0;

ultimo_angulo = 0; // guarda a última direção em que o inimigo olhou

ja_atacou = false;
