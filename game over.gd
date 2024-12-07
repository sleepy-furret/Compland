extends Node2D

@onready var piece_01 = $piece01
@onready var piece_02 = $piece02
@onready var piece_03 = $piece03
@onready var piece_04 = $piece04
@onready var piece_05 = $piece05
@onready var piece_06 = $piece06
@onready var death_sprite = $"death sprite"
@onready var death_animation = $"death sprite/death animation"
@onready var piece_anim = $"piece01/piece anim"


func _ready():
	$Button.visible = false
	$Button2.visible = false
	piece_01.visible = false
	piece_02.visible = false
	piece_03.visible = false
	piece_04.visible = false
	piece_05.visible = false
	piece_06.visible = false
	death_animation.play("death_symbol")
	await get_tree().create_timer(2.1).timeout
	death_sprite.visible = false
	piece_01.visible = true
	piece_02.visible = true
	piece_03.visible = true
	piece_04.visible = true
	piece_05.visible = true
	piece_06.visible = true
	piece_anim.play("death_anim")
	await get_tree().create_timer(0.4).timeout
	$Button.visible = true
	$Button2.visible = true
	$Button.grab_focus()
	

func _on_menu_button_down():
	get_tree().change_scene_to_file("res://title.tscn")
	Sounds.stop_wind_sound()
	

func _on_quit02_button_down():
	get_tree().quit()
	
