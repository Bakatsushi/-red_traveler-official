function scr_rarity_selector(){
	
	// Sorteia um número de 1 a 100
	var roll = irandom_range(1, 100);

	// Variável local para armazenar o resultado
	var _result = "";
	global.rarity = _result

	// Checa as regiões
	if (roll >= 1 && roll <= 60) {
		 _result = "common"; // comum (60%)
	}
	else if (roll >= 61 && roll <= 90) {
		_result = "incommon"; // incomum (30%)
	}
	else if (roll >= 91 && roll <= 100) {
		_result = "legendary"; // épico (10%)
	}
}
