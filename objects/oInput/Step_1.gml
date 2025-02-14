// Кнопки движения
global.rightKey = keyboard_check(ord("D"));
global.upKey = keyboard_check(ord("W"));
global.leftKey = keyboard_check(ord("A"));
global.downKey = keyboard_check(ord("S"));
global.restartKey = keyboard_check(ord("R"));
global.pauseKey = keyboard_check_pressed(vk_escape);
global.shootKey = mouse_check_button( mb_left );
global.swapKeyPressed = mouse_check_button(mb_right);