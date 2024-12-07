extends Node2D

var pannel_visible = false
var can_z = false

func _ready():
	$MarginContainer/VBoxContainer/Button.grab_focus()
	$Panel.visible = false
	Global.inside = false
	

func _on_button_button_down():
	get_tree().change_scene_to_file("res://main_scene.tscn")
	#if Global.screen == 1:
	#	get_tree().change_scene_to_file("res://main_scene.tscn")
	#	
	#
	#if Global.screen == 2:
	#	get_tree().change_scene_to_file("res://player.tscn")
	#	
	#	
	


func _on_options_button_down():
	$Panel.visible = true
	pannel_visible = true
	await get_tree().create_timer(0.1).timeout
	can_z = true
	

@export var fullscreen = false
@export var time = 0.1

func _process(delta):
	if pannel_visible == true:
		if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("any_move_key_ui"):
			$Panel.visible = false
			pannel_visible = false
		
	if Input.is_action_pressed("full_screen") and fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		await get_tree().create_timer(time).timeout
		fullscreen = false
		
		
	
	if Input.is_action_pressed("full_screen") and fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		await get_tree().create_timer(time).timeout
		fullscreen = true
		
	


func _on_quit_button_down():
	get_tree().quit()
