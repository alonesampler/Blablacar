function GetDamagedCreate(_hp = 10, _iframes = false)
{
	maxHp = _hp;
	hp = _hp;
	
	if (_iframes == true)
	{
		iframeTime = 0;
		iframeNumber = 90;
	}
	if (_iframes == false)
	{
		damageList = ds_list_create();
	}
}

function GetDamaged( _damageObj, _iframes = false ){

// уничтожение (да да дестрой) порой непонимаю для кого я комментирую ну если ты читаешь знай я это делал в 4:31 Утра

	// выход таймера с iframe
	if (_iframes == true && iframeTime > 0)
	{
		iframeTime--;
		
		if (iframeTime mod 5 == 0)
		{
			if (image_alpha == 1)
				image_alpha = 0;
			else
				image_alpha = 1;
		}
		
		hp = clamp(hp, 0 , maxHp);
		exit;
	}
	
	// что бы убедиться что после выхода из iframe альфа была 1 не прозрачной
	if (_iframes == true)
		image_alpha = 1;
	
	if (place_meeting(x, y, _damageObj)) || (_damageObj != oDamageParent && place_meeting(x,y, oDamageAll))
	{				
		var _instList = ds_list_create();		
		instance_place_list(x, y, _damageObj, _instList, false);
		
		if (_damageObj != oDamageParent)
			instance_place_list(x,y, oDamageAll, _instList, false);
			
		var _listSize = ds_list_size(_instList);		
		var _hitConfirm = false;
		
		for (var i = 0; i < _listSize; i++)
		{				
			var _inst = ds_list_find_value(_instList, i);	
			
			if _iframes == true || ds_list_find_index(damageList, _inst) == -1
			{	
				if (_iframes == false)
					ds_list_add(damageList, _inst);
				
				hp -= _inst.damage;
				_hitConfirm = true;
				_inst.hitConfirm = true;
			}
		}
		// Установить iframes если в нас попали
		if _iframes == true && _hitConfirm == true
			iframeTime = iframeNumber;
		
		ds_list_destroy(_instList);	
	}
	
	if (_iframes == false)
	{
		var _damageListSize = ds_list_size(damageList);
		for (var i = 0; i < _damageListSize; i++)
		{
			var _inst = ds_list_find_value(damageList, i);
			if (!instance_exists(_inst) || !place_meeting(x,y, _inst))
			{
				ds_list_delete(damageList, i);
				i--;
				_damageListSize--;
			}
		}
	}
	
	hp = clamp(hp, 0 , maxHp);
}
	
function GetDamagedCleanup()
{
	ds_list_destroy(damageList);
}