extends Node2D


@onready var player = $"Y Sorting/Player"
@onready var timerdoor_01 = $Timer
@export var fullscreen = false
@export var time = 0.1
@onready var fadeinoutanimation = $fadeinout/fadeinoutanimation
@onready var fadeinout = $fadeinout

func _ready():
	if Global.screen0201transition == true:
		Fade.fade_out()
	else:
		fadeinout.modulate.a = 0
		
	Sounds.play_wind_sound()

func _process(delta):
	if Input.is_action_just_pressed("ui_end"):
		Global.sl -= 1
	if Global.screen0201transition == true:
		#fadeinout.modulate.a = 1
		Fade.fade_out()
	else:
		#fadeinout.modulate.a = 0
		pass
	if Input.is_action_just_pressed("full_screen") and fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		await get_tree().create_timer(time).timeout
		fullscreen = false
		
		
	
	if Input.is_action_pressed("full_screen") and fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		await get_tree().create_timer(time).timeout
		fullscreen = true
		
	

#func screen01_02():
#	Global.screen0201transition = true
#	await timerdoor_01.timeout
#	Global.screen0201transition = false






func _on_area_2d_hello():
	print("hello!")


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
	
