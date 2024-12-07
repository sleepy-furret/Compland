extends Node2D

func _ready():
	if Global.screen0607transition == true:
		Fade.fade_out()
		
	
	if Global.screen0207transition == true:
		Fade.fade_out()
		
