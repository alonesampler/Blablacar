function DrawWeapon()
{
//отписовка оружия
	// отдаление оружия от игрока
	var _xOffset = lengthdir_x( weaponOffsetDist, aimDir );
	var _yOffset = lengthdir_y( weaponOffsetDist, aimDir );
	// настройка оружия по оси
	var _weaponsYscl = 1;
	
	if aimDir > 90 && aimDir < 270
	{
		_weaponsYscl = -1;
	}
	if aimDir < 360 && aimDir > 180
	{
		centerYOffset = - 7;
	}
	// изображения
	draw_sprite_ext( weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponsYscl, aimDir, c_white, image_alpha);	
}