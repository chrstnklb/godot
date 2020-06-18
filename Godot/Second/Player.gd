extends KinematicBody2D

# Define what is up in this world, for side scrollers
const UP = Vector2(0,-1)

export var motion = Vector2()
export var speed = 400
export var gravity = 12
export var jump_force = -500

func _physics_process(delta):
	
	motion.y += gravity
	
	if		Input.is_action_just_pressed("ui_up")	:	do_jump()
	elif	Input.is_action_pressed		("ui_right"):	do_move_right()
	elif	Input.is_action_pressed		("ui_left")	:	do_move_left()
	else											:	do_stand()
#
	# use the return value for rest movements
	motion = move_and_slide(motion, UP)
#
func do_stand():
	motion.x = 0
	$Run.hide()	
	$Body.show()
	$Sounds/Run.stop()

func do_jump():
	if is_on_floor():
		motion.y = jump_force
		$Sounds/Jump.play()

func do_move_left():
	do_move_animation(-speed, true)

func do_move_right():
	do_move_animation(speed, false)

func do_move_animation(speed, direction_flip):
	motion.x = speed
	$Run.flip_h = direction_flip
	$Run.play("walk-right")
	$Run.show()
	$Body.hide()
	if is_on_floor() && !$Sounds/Run.playing:
		$Sounds/Run.play()
	if !is_on_floor():
		$Sounds/Run.stop()
