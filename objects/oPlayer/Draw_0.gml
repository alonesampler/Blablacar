if aimDir >= 0 && aimDir < 180
{
	DrawWeapon();
}
//отрисовка себя
draw_self();
//отписовка оружия
if aimDir >= 180 && aimDir < 360
{
	DrawWeapon();
}