extends KinematicBody2D 

export var speed: = 100.0

const FLOOR_NORMAL = Vector2.ZERO

var _velocity: = Vector2.UP

var direction: = Vector2(0,0)
	
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_up"):		direction.y = -1
	if Input.is_action_just_pressed("ui_down"):		direction.y = 1
	if Input.is_action_just_pressed("ui_left"):		direction.x = -1
	if Input.is_action_just_pressed("ui_right"):	direction.x = 1
	
	
	_velocity = direction * speed
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)