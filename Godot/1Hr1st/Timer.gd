extends Node

var time = 0
var alreadyAsked

func _ready():
	time = OS.get_ticks_msec()
	alreadyAsked = false

#func _process(delta):
#	time = OS.get_ticks_msec() - time
	
#func get_actual_time():
#	return time

func get_time():
	if (!alreadyAsked):
		time = OS.get_ticks_msec() - time
		alreadyAsked = true
	return time
		