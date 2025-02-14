if screen_pause() {exit;}


if (createdDamageObjects == false)
{
	damageInstance = instance_create_depth(x,y,0,oDamageAll);
	
	with(damageInstance)
	{
		damage = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;		
	}
	
	createdDamageObjects = true;
}

if (floor(image_index) > 1)
{
	if instance_exists(damageInstance)
		instance_destroy(damageInstance)
}