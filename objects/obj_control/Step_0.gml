
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
}
