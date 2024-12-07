extends Node2D

func _ready():
	Sounds.stop_wind_sound()
	Sounds.play_beach_sound()
	Fade.fade_out()
	
