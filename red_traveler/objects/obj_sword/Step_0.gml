
image_angle = point_direction(x, y, mouse_x, mouse_y);

var spd = 4;

var alvo_x = obj_player.x;
var alvo_y = obj_player.y;

x = lerp(x, alvo_x, 1);
y = lerp(y, alvo_y, 1);

lifetime--;
if (lifetime <= 0) {
    instance_destroy();
}
