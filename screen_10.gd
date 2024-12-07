extends Node2D

var sea_speed = 1
@onready var tile_map = %TileMap
var text_speed = 0.5
@onready var splash = %splash
@onready var creator = %creator

func _ready():
	Fade.fade_out()
	
	await get_tree().create_timer(30.0).timeout
	
	Fade.large_fade_in()
	
	await get_tree().create_timer(3.0).timeout
	
	get_tree().change_scene_to_file("res://screen_11_text.tscn")
	

func _process(delta):
	tile_map.position.y += sea_speed
	splash.position.y += text_speed
	creator.position.y += text_speed
	if tile_map.position.y == 192:
		tile_map.position.y = 122
	
