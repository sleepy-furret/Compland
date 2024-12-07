extends Node2D

@onready var timerdoor_02 = $timerdoor02
@export var fullscreen = false
@export var time = 0.1
@onready var player = %Player
@onready var animation_player_s = $Sprite2D/AnimationPlayers
@onready var s = $Sprite2D
@onready var vanishs_sound = $"vanishs sound"
@onready var fadeinoutanimation = $fadeinout/fadeinoutanimation
@onready var player_sprite = $"Y Sorting/Player/Sprite2D"
@onready var animation_player = $TileMap/AnimationPlayer
var once_thinged = false

func _ready():
	
	
	if Global.pass_0702_thing == false:
		$TileMap3.visible = false
		$"Y Sorting/gate01".visible = true
	if Global.screen0702transitionuntil02 == true and Global.pass_0702_thing == false:
		$TileMap3.visible = true
		$TileMap.desapear()
		$TileMap2.queue_free()
		$"Y Sorting/gate01".visible = false
		Global.screen0702transitionuntil02 = false
	if Global.pass_0702_thing == true:
		
		$TileMap2.queue_free()
		$TileMap3.visible = true
	if Global.screen0102transition == true:
		$TileMap.modulate.a = 1.00
	Global.stop_player = 1
	player_sprite.frame_coords.x = 26
	Fade.fade_out()
	Fade.fade_out()
	await get_tree().create_timer(0.5).timeout
	Global.stop_player = 0
	s.frame_coords.x = 18
	

func _process(delta):
	if Global.pass_0702_thing == true and Global.screen0702transitionuntil02 == true:
		$TileMap.modulate.a = 1.0
	if Global.pass_0702_thing == true and Global.pass_0702_thing_once_true == false and Global.screen0702transitionhappen == true:
		$TileMap.fade_in()
		Sounds.play_descover_sound()
		Global.pass_0702_thing_once_true = true
		Global.pass_0702_thing_once = true
	#if Global.screen0102transition == true:
		#$TileMap3.visible = false
		#$TileMap.visible = true
	#if Global.screen0702transition == true:
		#$TileMap3.visible = true
		#$TileMap.visible = false
	if Global.vanishs == true:
		s.modulate.a = 0
	if Input.is_action_just_pressed("full_screen") and fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		await get_tree().create_timer(time).timeout
		fullscreen = false
		
		
	
	if Input.is_action_pressed("full_screen") and fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		await get_tree().create_timer(time).timeout
		fullscreen = true
		
	
	
	if Global.screen0102transition == true:
		$TileMap.modulate.a = 1.00
	
	if Global.pass_0702_thing == true and Global.screen0702transitionuntil02 == true:
		$TileMap.modulate.a = 1.0
	

#func screen01_02():
#	Global.screen0102transition = true
#	await timerdoor_02.timeout
#	Global.screen0102transition = false


func _on_gate_01_screen_02_01():
	pass # Replace with function body.
	

func screen01_02():
	player.position = Vector2(174,-1120)



func _on_area_2d_area_entered(area):
	if Global.vanishs == false and Global.scene_runing == true:
		animation_player_s.play("vanishs")
		vanishs_sound.play()
	Global.vanishs = true

func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()


func _on_area_2d_3_area_entered(area):
	if area.is_in_group("Player"):
		$TileMap.modulate.a = 1.00
		await get_tree().create_timer(3.0).timeout
		$TileMap.modulate.a = 1.0
