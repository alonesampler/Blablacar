depth = -y;

floatDirection = 0;
floatSpeed = 6;

if (image_index == 0)
	weapon = global.WeaponList.automaticGun;

if (image_index == 1)
	weapon = global.WeaponList.sniperGun;
	
if (image_index == 2)
	weapon = global.WeaponList.shotgunGun;
	
sprite_index = weapon.pickupSprite;
image_index = 0;

var _size = array_length(global.PlayerWeapons);
for (var i = 0; i < _size ; i++)
{
	if (weapon == global.PlayerWeapons[i])
		instance_destroy();
	
}