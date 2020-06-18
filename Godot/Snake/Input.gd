extends Node

func correct_key_is_pressed(searchedSummand):
	return	\
		Input.is_key_pressed(KEY_0) && searchedSummand == 0 || \
		Input.is_key_pressed(KEY_1) && searchedSummand == 1 || \
		Input.is_key_pressed(KEY_2) && searchedSummand == 2 || \
		Input.is_key_pressed(KEY_3) && searchedSummand == 3 || \
		Input.is_key_pressed(KEY_4) && searchedSummand == 4 || \
		Input.is_key_pressed(KEY_5) && searchedSummand == 5 || \
		Input.is_key_pressed(KEY_6) && searchedSummand == 6 || \
		Input.is_key_pressed(KEY_7) && searchedSummand == 7 || \
		Input.is_key_pressed(KEY_8) && searchedSummand == 8 || \
		Input.is_key_pressed(KEY_9) && searchedSummand == 9