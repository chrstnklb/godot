extends Actor


export var stomp_impulse: = 1000.0
export var wall_jumps_enabled: = true
export var strafe_jumps_enabled: = true
export var ceil_jumps_enabled: = true


func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)
	

func _on_EnemyDetector_body_entered(body: PhysicsBody2D) -> void:
	queue_free()


func _physics_process(delta: float) -> void:
	
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
		
	# these are variables from Actor
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	
	# move and slide does the work for us to multilpi _velocity by delta
	# return the actual movement vector
	# floor_normal parameter says godot what is the floor
	# FLOOR_NORMAL =is like Vector2.UP is like Vector(0,-1)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)
	
func get_direction() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if should_jump() else 0.0
	)
	
func should_jump() -> bool:
	return  Input.is_action_pressed("jump") && (should_wall_jump() || should_strafe_jump() || should_ceil_jump())

func should_wall_jump() -> bool:
	return wall_jumps_enabled and is_on_wall()
	
func should_strafe_jump() -> bool:
	return strafe_jumps_enabled and is_on_floor()		

func should_ceil_jump() -> bool:
	return ceil_jumps_enabled and is_on_ceiling()		
	
func calculate_move_velocity(
	linear_velocity: Vector2,
	direction: Vector2,
	speed: Vector2,
	is_jump_interrupted: bool
	) -> Vector2:
		
	var out: = linear_velocity
	
	out.x = speed.x * direction.x
	
	# += means add right sight up to left side	
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y == -1.0:
		out.y = speed.y * direction.y
		
	if is_jump_interrupted:
		out.y = 0.0
	
	return out


func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse #-linear_velocity.y
	return out
	
	
	
	
	
	
