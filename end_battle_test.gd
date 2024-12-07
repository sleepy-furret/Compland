extends Area2D

func _process(delta):
	#test:
	while Global.stop_player == 0 and Input.is_action_just_pressed("accept") and Global.insideplyrarea == 1 and Global.talked == 0:
		#Global.stop_player = 1
		#Global.player_move = false
		#Global.talked = 1
		Global.battle_win01 = true
		Global.was_in_battle = true
		#Global.inside = false
		
		Sounds.play_wind_sound()
		
		get_tree().change_scene_to_file("res://screen_03.tscn")
		

func _on_area_2d_area_entered(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		if Global.stop_player == 0:
			Global.insideplyrarea = 1


func _on_area_2d_area_exited(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		Global.insideplyrarea = 0
