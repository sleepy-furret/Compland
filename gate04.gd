extends Node2D

@onready var timer = $Timer
@onready var fadeinoutanimation = $fadeinout/fadeinoutanimation
@onready var player_sprite = $"../Player/Sprite2D"
signal screen02_01

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		
		
		
		Global.stop_player = 1
		Global.long_fade = true
		Fade.fade_in()
		await get_tree().create_timer(0.6).timeout
		Global.stop_player = 0
		Global.screen0403transition = true
		
		get_tree().change_scene_to_file("res://screen_03.tscn")
		
