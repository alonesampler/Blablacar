//урон
GetDamagedCreate(20, true);

// Движение
moveDirectional = 0;
moveSpeed = 2;
xSpeed = 0;
ySpeed = 0;

//Управление спрайтами	
centerYOffset = -5;
centerY = y + centerYOffset;
weaponOffsetDist = 4;
aimDir = 0;

face = 3;
sprite[0] = sPlayerRight;
sprite[1] = sPlayerUp;
sprite[2] = sPlayerLeft;
sprite[3] = sPlayerDown;

// информация о оружие 
shootTime = 0;
	
// добавление оружия игрока
array_push(global.PlayerWeapons, global.WeaponList.defaultGun);
selectedWeapon = 0;
weapon = global.PlayerWeapons[selectedWeapon];	