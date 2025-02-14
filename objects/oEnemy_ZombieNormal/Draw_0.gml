event_inherited();

var _healthPercent = hp / maxHp;
var _hpImage = _healthPercent * ( sprite_get_number( sEnemyHealthBar ) - 1 )
draw_sprite(sEnemyHealthBar, _hpImage ,x - 5, y - sprite_height - 5);
