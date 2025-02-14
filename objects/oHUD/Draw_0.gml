var _cameraX = camera_get_view_x(view_camera[0]);
var _cameraWidth = camera_get_view_width(view_camera[0]);
var _cameraY = camera_get_view_y(view_camera[0]);
var _cameraHeight = camera_get_view_height(view_camera[0]);

if instance_exists(oPlayer)
{
	var _borderOffset = 8;
	draw_sprite(sPlayerHealthBar, 0, _cameraX + _borderOffset, _cameraY + _borderOffset);
	
	for(var i = 0; i < playerMaxHp; i++)
	{
		var _image = 1;
		if (i + 1 <= playerHp) { _image = 2; }
		
		var _sep = 4;
		draw_sprite(sPlayerHealthBar, _image , _cameraX + _borderOffset + _sep*i, _cameraY + _borderOffset);
	}
}

if instance_exists(oPlayer)
{
	var _borderOffset = 8;
	draw_sprite(sEnemyCountKill, 0,_cameraX + _borderOffset,
				_cameraY + _borderOffset*2 + sprite_get_height(sPlayerHealthBar)
				)
}