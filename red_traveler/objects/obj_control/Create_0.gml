
randomize();

global.life_max = 10;
global.life = global.life_max;
global.exp = 0;
global.exp_max = 100;
global.level = 1;
global.levelUp = false;

spawnTimer = 60 * 2;

upgrade_num = 3;
upgrade_alpha = 1;
upgrade_scale = 1;

display_set_gui_size(640, 360);

enum Upgrade {
	Name,
	Script,
	Frequency,
	Length
}

upgrades_grid = ds_grid_create(Upgrade.Length, 0);
ds_grid_add_upgrade("Lantern_of_souls", -1, -1);
ds_grid_add_upgrade("Base_gun", -1, -1);
ds_grid_add_upgrade("Base_mele_atack", -1, -1);
