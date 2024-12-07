extends StaticBody2D

func _process(delta):
	#test:
	if Global.stop_player == 0 and Input.is_action_just_pressed("accept") and Global.insideplyrarea == 1 and Global.talked == 0 and Global.talking_clothesscr05 == true:
		
		
		if Global.inside == true:
			Global.inside = false
			Global.show_ui = false
		

func _on_area_2d_area_entered(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		if Global.stop_player == 0:
			Global.insideplyrarea = 1
			Global.talking_clothesscr05 = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		Global.insideplyrarea = 0
		Global.talking_clothesscr05 = false
