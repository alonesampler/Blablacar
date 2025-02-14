var _cameraX = camera_get_view_x(view_camera[0]);
var _cameraWidth = camera_get_view_width(view_camera[0]);
var _cameraY = camera_get_view_y(view_camera[0]);
var _cameraHeight = camera_get_view_height(view_camera[0]);

draw_set_alpha(alpha * alphaMax);
draw_rectangle_color(_cameraX, _cameraY, _cameraX + _cameraWidth, _cameraY + _cameraHeight,
					c_black, c_black, c_black,c_black, false);


//отприсовать текст
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_font(fnt8bitoperator);
//GameOver
var _gameoverTextOffset = -32;
draw_text_transformed(_cameraX + _cameraWidth/2, _cameraY + _cameraHeight/2 + _gameoverTextOffset,
					 "<GameOver>", 5,5,0)
//Нажмите кнопку
var _pressRestartTextOffset = 80;
draw_text_transformed(_cameraX + _cameraWidth/2, _cameraY + _cameraHeight/2 + _pressRestartTextOffset,
					 "- Press 'R' for restart -", 1,1,0);

//cбросил настройки
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);

