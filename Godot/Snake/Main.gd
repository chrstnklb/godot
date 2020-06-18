extends Node

var TARGET_SUM			= 10
var givenSummandList	= [1,2,3,4,5,6,7,8,9,10]
var summandCount		= 0
var givenSummand
var waslastRound		= false


func _ready():
	randomize()
	givenSummandList.shuffle()


func _process(delta):
	if !waslastRound:	init_next_round()
	else:				init_game_end()


func init_next_round():
	givenSummand = givenSummandList[summandCount]
	$Summand.set_text(str(givenSummand))
	
	if	$Input.correct_key_is_pressed(TARGET_SUM - givenSummand):
		summandCount += 1
		waslastRound = (summandCount == givenSummandList.size())


func init_game_end():
	$GameOver.end_game()
	$Summand.hide()
