extends Label

var gameIsOver = false
var gameDuration = ""


func _ready():
	hide()

func end_game():
	if !gameIsOver:
		gameDuration = $GameTime.get_game_run_time() + "\nSek "
		set_text(gameDuration)
		gameIsOver = true
		show()