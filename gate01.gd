extends Node2D

@onready var timer = $Timer
@onready var fadeinout = $"../../fadeinout"
@onready var fadeinoutanimation = $"../../fadeinout/fadeinoutanimation"
@onready var player_sprite = $"../Player/Sprite2D"

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		Global.screen = 2
		Global.screen0102transition = true
		
		Global.stop_player = 1
		player_sprite.frame_coords.x = 26
		Fade.fade_in()
		Fade.fade_in()
		await get_tree().create_timer(0.5).timeout
		Global.stop_player = 0
		
		get_tree().change_scene_to_file("res://screen_02.tscn")
