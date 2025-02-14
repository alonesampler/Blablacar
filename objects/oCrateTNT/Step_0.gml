GetDamaged(oDamageParent);

var _healthPrecent = (1 - hp/maxHp);
image_index = _healthPrecent * (image_number);

if ( hp <= 0)
{	
	var _boomInstance = instance_create_depth(x + 8, y + 8, -3000, oBigBoom);
	with (_boomInstance)
	{
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	instance_destroy();
}