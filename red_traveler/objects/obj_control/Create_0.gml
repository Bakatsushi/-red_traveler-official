
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

global.gun_selected = -1;
global.upgrades_selected = -1;

enum Upgrade {
	Name,
	Script,
	Category,
	Frequency,
	MaxLevelUpgrade,
	Length
}

upgrades_grid = ds_grid_create(Upgrade.Length, 0);
//Armas base
ds_grid_add_upgrade("Lantern_of_souls",    -1, "gun", -1, -1);
ds_grid_add_upgrade("Base_gun",            -1, "gun", -1, -1);
ds_grid_add_upgrade("Base_melee_atack",    -1, "gun", -1, -1);

//Upgrades
ds_grid_add_upgrade("Velocidade +",        -1, "upgrades", -1, -1);
ds_grid_add_upgrade("Dano +",              -1, "upgrades", -1, -1);
ds_grid_add_upgrade("Range de coleta +",   -1, "upgrades", -1, -1);
ds_grid_add_upgrade("Modificador de Xp +", -1, "upgrades", -1, -1);

//Melhorias
ds_grid_add_upgrade("Lantern_of_power",    -1, "upgrades", -1, -1);
