/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе

// Inherit the parent event
event_inherited();
moveSpeed = 0;
chaseMoveSpeed = .5;
dir = 0;
xSpeed = 0;
ySpeed = 0;
face = 0;
sprite[0] = sEnemy_ZombieNormalRight;
sprite[1] = sEnemy_ZombieNormalLeft;

state = 0;

cooldownTimer = 4*45;
shootTimer = irandom(cooldownTimer);
windupTime = 60;
recoverTimer = 45;
bulletInst = noone;

bulletXoff = -10;
bulletYoff = -16;
