if screen_pause() {exit;}

floatDirection += floatSpeed;
y = ystart + dsin(floatDirection)*2;


if place_meeting(x,y,oPlayer)
{
	if (oPlayer.hp != oPlayer.maxHp)
	{
		oPlayer.hp += heal;
		instance_destroy();
	}
	
}