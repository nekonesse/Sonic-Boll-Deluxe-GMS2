x=mouse_x
y=mouse_y

left=mouse_check_button(mb_left)
leftp=mouse_check_button_pressed(mb_left)
right=mouse_check_button(mb_right)
rightp=mouse_check_button_pressed(mb_right)
middle=mouse_check_button(mb_middle) || keyboard_check(vk_space)
middlep=mouse_check_button_pressed(mb_middle) || keyboard_check_pressed(vk_space)
ctrl=keyboard_check_direct(vk_control)
shift=keyboard_check_direct(vk_shift)
scrw=mouse_wheel_down()-mouse_wheel_up()
//escape=input_esc()

//Replaced with Toggle Lemon Music button

/*
//MUTE with -
if keyboard_check_direct(189) && !keyboard_check_direct(vk_shift) && global.focus mus_volume(0)

//MUTE with + ("do you mean unmute" -moster)
if keyboard_check_direct(187) && !keyboard_check_direct(vk_shift) && global.focus mus_volume(1)
*/

/*if (ctrl) {
    if (keyboard_check_pressed(ord("S"))) {editsave(global.lemonfilename) if !(settings("nolemonsound")) sound("lemonlevelsave")}
    if (keyboard_check_pressed(ord("Z"))) editundo()
    if (keyboard_check_pressed(ord("C"))) editcopy(0)
    if (keyboard_check_pressed(ord("X"))) editcopy(1)
    if (keyboard_check_pressed(ord("V"))) editpaste()
    if (keyboard_check_pressed(ord("A"))) editall()
} else {
    if (keyboard_check_pressed(ord("S"))) {tool=1 if !(settings("nolemonsound")) sound("lemonselecttool")}
    if (keyboard_check_pressed(ord("D"))) {tool=0 if !(settings("nolemonsound")) sound("lemonselecttool")}
    if (keyboard_check_pressed(ord("F"))) {tool=2 if !(settings("nolemonsound")) sound("lemonselecttool")}
    if (keyboard_check_pressed(ord("G"))) {if !(settings("nolemonsound")) sound("lemonselecttool") with (gridtoggle) event_user(0)}
    if (keyboard_check_pressed(vk_delete)) {editdeleteselection() if editcheckselection() if !(settings("nolemonsound")) sound("lemonerase")}
    if (keyboard_check_pressed(vk_f5)) {edittest(1)}
}*/

if (middle) {
    leftp=0
    left=0
}

if (left) {
    if (leftp) image_index=1
    image_index=min(2,image_index+0.2)
} else if (right) {
    if (rightp) image_index=3
    image_index=min(4,image_index+0.2)
} else image_index=0

if !(drawregion.hide_curs) image_xscale=1
else image_xscale=editzoom.level
image_yscale=image_xscale