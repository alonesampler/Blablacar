if screen_pause() {exit;}
 
 switch( state )
{
	case 0:
	#region
		if instance_exists(oPlayer){
			dir = point_direction(x,y, oPlayer.x,oPlayer.y);
		}
		
		moveSpeed = chaseMoveSpeed;
		
		var _cameraLeft = camera_get_view_x(view_camera[0]);
		var _cameraRight = _cameraLeft + camera_get_view_width(view_camera[0]);
		var _cameraTop = camera_get_view_y(view_camera[0]);
		var _cameraBottom = _cameraTop + camera_get_view_height(view_camera[0]);
		
		if (bbox_right > _cameraLeft && bbox_left < _cameraRight && bbox_bottom > _cameraTop && bbox_top < _cameraBottom)
		{
		shootTimer++;
		}
		
		if (shootTimer > cooldownTimer)
		{
			state = 1;
			
			shootTimer = 0;
		}
		
	#endregion
	break;
	
	case 1:
	#region
		if instance_exists(oPlayer){
			dir = point_direction(x,y, oPlayer.x,oPlayer.y);
		}
		
		moveSpeed = 0;
		
		image_index = 0;
		
		shootTimer++;
		
	    if (shootTimer == 1 && face == 0)
		{
			bulletInst = instance_create_depth( x + bulletXoff, y + bulletYoff, depth, oEnemyBullet);	
		}
		
		if (shootTimer == 1 && face == 1)
		{
			bulletInst = instance_create_depth( x + bulletXoff , y + bulletYoff, depth, oEnemyBullet)
		}
		
		if (shootTimer <= windupTime && instance_exists(bulletInst))
		{
			bulletInst.x = x + bulletXoff*face;
			bulletInst.y = y + bulletYoff;
		}
		
		if (shootTimer == windupTime && instance_exists(bulletInst))
		{
			bulletInst.state = 1;
		}
		
		if (shootTimer > windupTime)
		{
			state = 0;
			
			shootTimer = 0;
		}
	#endregion
	break
	
}
 
 
 
 #region// Мувмент к игроку	
	
	xSpeed = lengthdir_x(moveSpeed, dir);
	ySpeed = lengthdir_y(moveSpeed, dir);
	
	if place_meeting( x + xSpeed, y, oWall ) || place_meeting(x + xSpeed, y, oEnemy) 
	{
		xSpeed = 0;
	}
	
	if place_meeting( x, y + ySpeed, oWall ) || place_meeting(x, y + ySpeed, oEnemy)
	{
		ySpeed = 0;
	}
	
	x += xSpeed
	y += ySpeed
	
	depth = -y;
	
#endregion	

#region//управление слайдом 
	face = round(dir/180); //если ты это как то читаешь и это не я (то есть создатель Влад) то тебе мини гайд 
	if face == 2 { face = 0;}//менять слайды довольно легко другим способом, просто мне не лень было отзеркалить
							// и создать ещё 1 слайд а так ты бы мог добиться такого же эффекта
	mask_index = sprite[0];				// if xSpeed > 0 {face = 1;};
	sprite_index = sprite[face];		// if xSpeed < 0 {face = -1;};
										// image_xscale = face; (ты бы посути зеркалил сам объект
										// но такое делать как бы не особо, ну если ты новичок то мог бы и так
										// просто беда в том что как ты настроил маску столкновения.
										// видимо сидеть до утра была плохая идея но это просто мой проект для
										// практики так что думаю я могу и порезвиться!!!
#endregion

event_inherited();

