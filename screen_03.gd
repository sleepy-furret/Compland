extends Node2D

@onready var fadeinoutanimation = $fadeinout/fadeinoutanimation
@onready var player = $Player
var gate03s = preload("res://gate03.tscn")
var ui_player = preload("res://UI.tscn")

func _ready():
	if Global.inside == false:
		Global.show_ui == false
	if Global.battle_win01:
		var instance = gate03s.instantiate()
		add_child(instance)
		instance.position = Vector2(43, 283)
		instance.z_index = -6
	#if Global.inside == true:
		#var instance = ui_player.instantiate()
		#add_child(instance)
		#
	Fade.fade_out()
	Global.scene_runing = true
	if Global.was_in_battle == true:
		player.position = Global.player_attack_position
		Global.was_in_battle = false

func _process(delta):
	if Global.long_fade == true:
		fadeinoutanimation.play("3sfade_in")
		Global.long_fade = false
	
