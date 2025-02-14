if screen_pause() {exit;}


// передвижение пули
	xSpeed = lengthdir_x(spd,dir);
	ySpeed = lengthdir_y(spd,dir);
	
	x += xSpeed;
	y += ySpeed;
	depth = -y;

// Отчистка пуль

	if hitConfirm == true && enemyDestroy == true {destroy = true;};

	//Уничтожение	
	if destroy = true { instance_destroy() };
	
	if place_meeting(x,y, oSolidWall){	destroy = true;	};
	
	// Пули вне дистанции
	if point_distance(xstart, ystart, x, y ) > maxDistance { destroy = true; };
	
	