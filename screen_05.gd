extends Node2D

func _ready():
	
	if Global.screen0605transition == true:
		Fade.fade_out()
		
	
	if Global.inside == false:
		Global.show_ui = false
	if Global.screen0405transition == true:
		Global.scene_runing = true
		Global.stop_player = 0
		
