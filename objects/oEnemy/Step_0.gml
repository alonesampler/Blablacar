GetDamaged(oDamageEnemy)
	
if (hp <= 0)
{
	global.enemyKillCount++;
	
	if (global.enemyKillCount mod 30 == 0)
	{
		instance_create_depth(x,y,depth,oHeart);
	}
	instance_destroy();
	
}

