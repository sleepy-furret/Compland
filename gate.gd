extends Node2D

@onready var timer = $Timer
@onready var fadeinoutanimation = $fadeinout/fadeinoutanimation
@onready var player_sprite = $"../Player/Sprite2D"
signal screen02_01

@export var transiton: String
@export var scene: String
@export var direction: int
@export var fade: int
@export var fadein_or_out: String
@export var time: float

func _ready():
	if direction == 1:
		%Sprite2D.frame_coords.x = 0
	if direction == 2:
		%Sprite2D.frame_coords.x = 1
	if direction == 3:
		%Sprite2D.visible = false

func _on_area_2d_area_entered(area):
	if area.is_in_group("Player"):
		
		
		
		Global.scene_runing = false
		Global.long_fade = true
		if fade == 1:
			if fadein_or_out == "in":
				Fade.fade_in()
			if fadein_or_out == "out":
				Fade.fade_out()
		await get_tree().create_timer(time).timeout

		if transiton == "0405":
			Global.screen0405transition = true
		if transiton == "0504":
			Global.screen0504transition = true
		if transiton == "0605":
			Global.screen0605transition = true
		if transiton == "0607":
			Global.screen0607transition = true
		if transiton == "0706":
			Global.screen0706transition = true
		if transiton == "0806":
			Global.screen0806transition = true
		if transiton == "0702":
			Global.screen0702transition = true
			Global.screen0702transitionuntil02 = true
			Global.screen0702transitionhappen = true
		if transiton == "0207":
			Global.screen0207transition = true
		if transiton == "0908":
			Global.screen0908transition = true
		

		Global.scene_runing = true
		get_tree().change_scene_to_file(scene)
		
