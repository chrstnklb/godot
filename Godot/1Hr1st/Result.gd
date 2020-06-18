extends Label

# Declare member variables here. Examples:
var hitCounter = 0
var additionalText = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Hits: " + str(hitCounter) + additionalText
	
func _process(delta):
	if(Input.is_action_just_released("ui_down")):
		hitCounter += 1
		self.text = "Hits: " + str(hitCounter)  + additionalText
		if hitCounter == 10:
			self.text = self.text + (" in " + str($Timer.get_time()) + " milliseconds!")

	if(Input.is_action_just_released("ui_up")):
		hitCounter -= 1
		self.text = "Hits: " + str(hitCounter)
		
	if hitCounter == 11: additionalText = " STOP"
	if hitCounter == 12: additionalText = " No realy"
	if hitCounter == 13: additionalText = " Please STOP"
	if hitCounter == 14: additionalText = " Ok, I thin I have to"
	if hitCounter == 15: additionalText = " Really?"
	if hitCounter == 16: additionalText = " I warn you"
	if hitCounter == 17: additionalText = " 3"
	if hitCounter == 18: additionalText = " 2"
	if hitCounter == 19:
		additionalText = " 1"
		self.show()
	if hitCounter == 20: additionalText = " ok, I will hide"
	if hitCounter == 21: self.hide()
	if hitCounter == 25:
		additionalText = " Common!!! Really? Stop It!!! Please"
		self.show()
	