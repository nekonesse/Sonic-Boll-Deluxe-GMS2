input_get(p2)

var moveDir = right-left

StepProgram();

hsp += accel*moveDir

if moveDir == 0
hsp = 0

if (abut) && (grounded) {
	vsp=-7
	show_debug_message("jump")
}

if (cbut) {
	vsp=-20
}

vsp += grav

player_collision();