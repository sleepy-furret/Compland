extends StaticBody2D



func _process(delta):
	#test:
	while Global.stop_player == 0 and Input.is_action_just_pressed("accept") and Global.insideplyrarea == 1 and Global.talked == 0:
		Fade.fade_in()
		
		Global.scene_runing = false
		await get_tree().create_timer(0.5).timeout
		
		get_tree().change_scene_to_file("res://screen_10.tscn")

func _on_area_2d_area_entered(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		if Global.stop_player == 0:
			Global.insideplyrarea = 1


func _on_area_2d_area_exited(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		Global.insideplyrarea = 0
