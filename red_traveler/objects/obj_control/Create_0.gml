
randomize();

global.exp = 0;
global.exp_max = 100;
global.level = 1;
global.levelUp = false;

spawnTimer = 60 * 2;

upgrade_num = 3;
upgrade_alpha = 1;
upgrade_scale = 1;

display_set_gui_size(640, 360);

upgrades_grid = ds_grid_create(0, 0);
