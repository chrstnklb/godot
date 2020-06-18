extends Node2D

var width				= OS.get_window_size().x
var height				= OS.get_window_size().y

const TILE_SIZE			= 64#$Tiles/GameBorderWall/GameBorderTile. 64	#TODO: get this info from tile itself
const LENGTH_TO_CENTER	= TILE_SIZE * 0.5
const BORDER_OFFSET		= TILE_SIZE #Offset to set the border around the visible game field

var horizontal_tile_count	= width	/ TILE_SIZE		
var vertical_tile_count	= height/ TILE_SIZE		

func _ready():

	create_bottom_border()
	#create_top_border()
	create_left_border()
	create_right_border()
#	pass
	
func create_bottom_border():
	var yPosition = height - LENGTH_TO_CENTER + BORDER_OFFSET
	draw_horizontal_border(yPosition)
	
func create_top_border():
	var yPosition = 0 + LENGTH_TO_CENTER - BORDER_OFFSET
	draw_horizontal_border(yPosition)
	
func create_left_border():
	var xPosition = 0 + LENGTH_TO_CENTER - BORDER_OFFSET
	draw_vertical_border(xPosition)
	
func create_right_border():
	var xPosition = width - LENGTH_TO_CENTER + BORDER_OFFSET
	draw_vertical_border(xPosition)
	
func draw_horizontal_border(yPosition):
	var xPosition
		
	for i in range (horizontal_tile_count):
		xPosition = (i * TILE_SIZE) - LENGTH_TO_CENTER + BORDER_OFFSET
		draw_tile(Vector2(xPosition,yPosition))
	
func draw_vertical_border(xPosition):
	var yPosition
	
	for i in range (vertical_tile_count):
		yPosition = (i * TILE_SIZE) + LENGTH_TO_CENTER
		draw_tile(Vector2(xPosition,yPosition))
	
func draw_tile(vector):
	var tile = preload("res://GameBorderTile.tscn").instance()
	tile.position = vector
	add_child(tile)
	tile.show()
	
func calc_tile_position(vector):
	return Vector2(vector.x * TILE_SIZE - LENGTH_TO_CENTER, vector.y * TILE_SIZE - LENGTH_TO_CENTER)
