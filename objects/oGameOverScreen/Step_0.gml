var restartKey = global.restartKey;

alpha += alphaSpeed;
alpha = clamp(alpha, 0 , 1);

if restartKey
	room_restart();