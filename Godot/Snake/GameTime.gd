extends Node

var startTime
var endTime
var timeFormat = "%.3f"

func _ready():
	startTime = OS.get_ticks_msec()
	
func get_game_run_time():
	if endTime == null:
		endTime = float(OS.get_ticks_msec() - startTime) / 1000
		return str(timeFormat % endTime)