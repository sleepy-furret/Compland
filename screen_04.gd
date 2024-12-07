extends Node2D

var ui_player = preload("res://UI.tscn")

func _ready():
	if Global.inside == false:
		Global.show_ui == false
	if Global.screen0304transition == true: 
		Fade.fade_out()
	if Global.inside == false:
		Global.show_ui == false

#func _process(delta):
	#if Global.inside == false: 
		#Global.show_ui = false
