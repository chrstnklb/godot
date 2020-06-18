extends KinematicBody2D 
class_name Actor

var FLOOR_NORMAL = Vector2.UP

export var speed: = Vector2(300.0, 1000.0)

# the .0 tells godot, that this variable is a double
export var gravity: = 4000.0

# := tells Godot to use the same type for the left side as for the right side
# th number in Vector is the pixel count to move in one second
# ZERO, so that there is no movement at all as default
var _velocity: = Vector2.ZERO

# is called in every frame 30-60 times per second automatically
# delta is a value that the engine gives us at every tick
# delta represents the time since the last frame
# delta is used to make the game frame rate independent
# same speed at every machine
func _physics_process(delta: float) -> void:
	pass
