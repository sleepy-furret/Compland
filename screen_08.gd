extends Node2D

func _ready():
	Fade.fade_out()
	Sounds.play_wind_sound()
	Sounds.stop_beach_sound()
	
	
