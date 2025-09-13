
// parar jogo para escolher upgrade
if keyboard_check(vk_enter){
	global.levelUp = false
}

if global.levelUp == true {
	alarm[0]++;
	exit;
}

#region // Criação de inimigos fora da tela
var _side = irandom(1);

if alarm[0] <= 0 {
	
	if _side == 0 {
	
		var _xx = irandom_range(global.cmx, global.cmx + global.cmw);
		var _yy = choose(global.cmy - 16, global.cmy + global.cmh + 16);
	
		instance_create_layer(_xx, _yy, "Instances", obj_enemy_1);
	}
	
	if _side == 1 {
	
		var _xx = choose(global.cmx - 16, global.cmx + global.cmw + 16);
		var _yy = irandom_range(global.cmy, global.cmy + global.cmh);
		
		instance_create_layer(_xx, _yy, "Instances", obj_enemy_1);
	}
	
	alarm[0] = spawnTimer;
}
#endregion

// sitema de xp
if global.exp >= global.exp_max {
    global.level++;
    global.exp = global.exp - global.exp_max;
    global.levelUp = true;
    
    global.exp_max = global.exp_max + 10 + global.exp_max * .1;
    
    // Criar listas separadas
    upgrade_list_guns = ds_list_create();
    upgrade_list_upgrades = ds_list_create();

    // Pecorrer toda a grid e separar por categoria
    var total = ds_grid_height(upgrades_grid);
    for (var i = 0; i < total; i++) {
        var _cat = upgrades_grid[# 2, i]; // pega categoria
        switch (_cat) {
            case "gun":
                ds_list_add(upgrade_list_guns, i);
                break;
            case "upgrades":
                ds_list_add(upgrade_list_upgrades, i);
                break;
        }
    }
}

// testes de armas
if global.gun_selected == 1 {
	
	global.gun_selected = -2;
	instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_gun_base);
}

if global.gun_selected == 2 || global.gun_selected == -3 {
    
	global.gun_selected = -3;
    var _timer_sword_max = 60; 
    
    if (_timer_sword <= 0) {
        instance_create_layer(obj_player.x + 4, obj_player.y, "Instances", obj_sword);
        _timer_sword = _timer_sword_max;
    }
    
    _timer_sword--;
}
