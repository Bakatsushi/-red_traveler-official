
#region // sistema de escolha de upgrade
if global.levelUp == true {
	draw_set_alpha(.6);
	draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	
	var _sprw = sprite_get_width(spr_level_up_hud);
	var _sprh = sprite_get_height(spr_level_up_hud);
	var _buffer = 10;
	var _xx = display_get_gui_width()/2;
	var _yy = display_get_gui_height()/2 - _sprh - _buffer;
	
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);
	
	for (var i = 0; i < upgrade_num; i++) {
    
		var _spry = _yy + (_sprh + _buffer) * i;

		// Decide qual lista usar baseado no level
		var _y = -1;
		
		if (global.level <= 2) {
			_y = upgrade_list_guns[| i];
		} else {
			_y = upgrade_list_upgrades[| i];
		}
    
		var _name = upgrades_grid[# Upgrade.Name, _y];
    
		// Hover e clique
		if (point_in_rectangle(_mx, _my, _xx - _sprw/2, _spry - _sprh/2, _xx + _sprw/2, _spry + _sprh/2)) {
        
			if (mouse_check_button_pressed(mb_left)) {
				if (global.level <= 2) {
					global.gun_selected = _y;
				} else {
                global.upgrades_selected = _y;
				}
				global.levelUp = false;
			}
        
			upgrade_alpha[i] = 1;
			upgrade_scale[i] = 1.1;
		} else {
			upgrade_alpha[i] = 0.6;
			upgrade_scale[i] = 1;
		}
    
	    // Desenho do HUD
	    draw_sprite_ext(spr_level_up_hud, -1, _xx, _spry, upgrade_scale[i], upgrade_scale[i], 0, c_white, upgrade_alpha[i]);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
	    draw_text(_xx, _spry, _name);
	}

}
#endregion

draw_sprite_ext(spr_life_bar, -1, 7, 21, global.life/global.life_max, 1, 0, c_white, 1);
draw_sprite(spr_life_hud, -1, 5, 20);
draw_sprite(spr_exp_hud, -1, 5, 10);
draw_sprite_ext(spr_exp_bar, -1, 6, 11, global.exp/global.exp_max, 1, 0, c_white, 1);

draw_text(300, 5, "Level: " + string(global.level));

draw_text(5, 47, string(global.gun_selected));
draw_text(5, 62, string(global.upgrades_selected));

