// Конструктор оружия
function CreateWeapon( _sprite = sDefaultGun, _lenght = 0, _bulletObj = oBlueBullets,
_cooldown = 1, _bulletNum = 1, _spread = 1, _pickupSprite = sDefaultGun) constructor
{
	sprite = _sprite;
	lenght = _lenght;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
	
}

// оружия игрока
global.PlayerWeapons = array_create(0);
	



// Оружия
global.WeaponList = {
	
	defaultGun : new CreateWeapon(
		sDefaultGun,                                                                    // спрайт
		sprite_get_bbox_right(sDefaultGun) - sprite_get_xoffset(sDefaultGun),           // длина
		oDefaultBullet,                                                                 // пули
		10,																				 // кулдаун
		1,																				// сколько пуль
		0,                                                                              //градус разброса
		sDefaultGun),																	//спрайт поднятия
	
	automaticGun : new CreateWeapon(
		sAutomaticGunPickup,
		sprite_get_bbox_right(sAutomaticGunPickup) - sprite_get_xoffset(sAutomaticGunPickup),
		oAutomaticBullet,
		5,
		1,
		0,
		sAutomaticGunPickup),
		
	shotgunGun : new CreateWeapon(
	sShotgunGun,
	sprite_get_bbox_right(sShotgunGun) - sprite_get_xoffset(sShotgunGun),
	oShotgunBullet,
	25,
	7,
	60,
	sShotgunGunPickup),
	
	sniperGun : new CreateWeapon(
	sSniperGun,
	sprite_get_bbox_right(sSniperGun) - sprite_get_xoffset(sSniperGun),
	oSniperBullet,
	50,
	1,
	0,
	sSniperGunPickup),
	
	}