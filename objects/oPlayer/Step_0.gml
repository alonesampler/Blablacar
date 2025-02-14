// Кнопки движения
var rightKey = global.rightKey;
var upKey = global.upKey;
var leftKey = global.leftKey;
var downKey = global.downKey;
var shootKey = global.shootKey;
var pauseKey = global.pauseKey
var switchGunScrollUp = mouse_wheel_up();
var switchGunScrollDown = mouse_wheel_down();
var switchGunKeyUp = keyboard_check_pressed(ord("E"));
var switchGunKeyDown = keyboard_check_pressed(ord("Q"));
//var teleportKey = keyboard_check_pressed(ord("SPACE"));

#region // Пауза

if pauseKey
{
	if (!instance_exists(oPauseMenu))
	{
		instance_create_depth(0,0,0, oPauseMenu);
	} else {
		instance_destroy(oPauseMenu);
	}
} else 
{
	
}

if screen_pause() {exit;}

#endregion // Пауза


#region //мувмент


var _horizontalKey = rightKey - leftKey;
var _verticalKey = downKey - upKey;
moveDirectional = point_direction(0,0, _horizontalKey, _verticalKey);


// получения скорости x и y
var _speed = 0;
var _inputLevel = point_distance(0,0, _horizontalKey, _verticalKey);
_inputLevel = clamp(_inputLevel, 0, 1);
_speed = moveSpeed * _inputLevel;

xSpeed = lengthdir_x( _speed, moveDirectional );
ySpeed = lengthdir_y( _speed, moveDirectional );

	
// столкновение
if place_meeting( x + xSpeed, y, oWall )
{
	xSpeed = 0;
}
	
if place_meeting( x, y + ySpeed, oWall )
{
	ySpeed = 0;
}	

// перемещение игрока
x += xSpeed;
y += ySpeed;

// глубина
depth = -bbox_bottom;


#endregion

GetDamaged(oDamagePlayer, true);

#region//Прицеливание игрока

centerY = y + centerYOffset;
//цель
aimDir = point_direction(x, centerY, mouse_x, mouse_y);

#endregion


#region// управление спрайтами

face = round(aimDir/90);
if face == 4
	face = 0;

if (xSpeed == 0 && ySpeed == 0)
	image_index = 0;


mask_index = sprite[3];
sprite_index = sprite[face];
#endregion	


#region//Свап оружия


var _playerWeapons = global.PlayerWeapons;
var max_w = array_length(_playerWeapons) - 1;

if (switchGunScrollUp || switchGunKeyUp)
{
	selectedWeapon = clamp(selectedWeapon+1,0,max_w);
	//if selectedWeapon >= array_length(_playerWeapons){ selectedWeapon = 0;}
	weapon = _playerWeapons[selectedWeapon];
}


if (switchGunScrollDown || switchGunKeyDown)
{
	selectedWeapon = clamp(selectedWeapon-1,0,max_w);
	//if selectedWeapon <= 0 { selectedWeapon = max_w - 1;}
	weapon = _playerWeapons[selectedWeapon];
}

weapon = _playerWeapons[selectedWeapon];

#endregion // мувмент


#region// стрельба

if (shootTime > 0)
	shootTime--;
	
if (shootKey && shootTime <= 0)
{	
	shootTime = weapon.cooldown;
	var _xOffset = lengthdir_x(weapon.lenght + weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weapon.lenght + weaponOffsetDist, aimDir);
	
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max(weapon.bulletNum-1, 1);
	
	for (var i = 0; i < weapon.bulletNum; i++)
	{
		var _bulletInst = instance_create_depth(x + _xOffset, centerY + _yOffset, depth+1, weapon.bulletObj);
		
		var _self = id;
		with(_bulletInst)
		{	
			dir = _self.aimDir - _spread/2 + _spreadDiv*i;
		}
	}
}

#endregion// стрельба

#region// cмерть / конец игры

if (hp <= 0)
{	
	instance_create_depth(0,0,0,oGameOverScreen);
	instance_destroy();
}

#endregion