extends Node2D

@onready var timer = $Timer
@onready var fadeinoutanimation = $"../../fadeinout/fadeinoutanimation"
@onready var player_sprite = $"../Player/Sprite2D"
signal screen02_01

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		Global.screen = 1
		Global.screen0201transition = true
		Global.screen0702transitionhappen = false
		
		Global.stop_player = 1
		player_sprite.frame_coords.x = 26
		Fade.fade_in()
		await get_tree().create_timer(0.6).timeout
		Global.stop_player = 0
		
		get_tree().change_scene_to_file("res://main_scene.tscn")
		
