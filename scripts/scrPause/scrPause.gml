function screen_pause(){

	if instance_exists(oScreenPause)
	{
		image_speed = 0;
		return true;
	} else {
		image_speed = 1;
		return false;
	}
}