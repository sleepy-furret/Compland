extends StaticBody2D

@onready var fadeinoutanimation = $"../fadeinout/fadeinoutanimation"

func _process(delta):
	#test:
	while Global.stop_player == 0 and Input.is_action_just_pressed("accept") and Global.insideplyrarea == 1 and Global.talked == 0 and Global.is_beging_attacked == false:
		Fade.fade_in()
		Global.scene_runing = false
		
		await get_tree().create_timer(0.5).timeout
		
		Global.screen = 2
		Global.screen0302transition = true
		
		
		#player_sprite.frame_coords.x = 26
		
		Global.scene_runing = true
		
		get_tree().change_scene_to_file("res://screen_02.tscn")
		
		

func _on_area_2d_area_entered(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		if Global.stop_player == 0 and Global.is_beging_attacked == false:
			Global.insideplyrarea = 1


func _on_area_2d_area_exited(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		Global.insideplyrarea = 0
