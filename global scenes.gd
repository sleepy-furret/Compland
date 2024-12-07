extends Node2D

var newui = preload("res://UI.tscn")
var instance = newui.instantiate()
@onready var ui = $Control

func _ready():
	ui.visible = false

func _process(delta):
	print(Global.pass_0702_thing_once)
	
	if Global.show_ui == true:
		ui.visible = true
	
	if Global.show_ui == false:
		ui.visible = false
	
	if Global.sl <= 0:
		get_tree().change_scene_to_file("res://game_over.tscn")
		Global.sl = 20
		Global.show_ui = false
	
	#if Input.is_key_pressed(KEY_END):
		#instance.queue_free()
	#
	#
	#if Global.show_ui == true and Global.ui_instanciated == false:
		#add_child(instance)
		#
		#Global.ui_instanciated = true
	#if Global.inside == true:
		#Global.show_ui = true
	#if Global.sl <= 0:
		#get_tree().change_scene_to_file("res://game_over.tscn")
		#Global.sl = 20
		#Global.show_ui = false
	#if Global.show_ui == false and Global.ui_instanciated == true:
		#instance.queue_free()
		#Global.ui_instanciated = false
	#
	#if Input.is_key_pressed(KEY_END):
		#instance.queue_free()
	#
