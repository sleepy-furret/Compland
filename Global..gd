extends Node

var file = "user://room-save.save"

var screen = 1
var screen01 = 0
var screen02 = 0
var screen0201transition = false
var screen0102transition = false
var screen0302transition = false
var screen0403transition = false
var screen0304transition = false
var screen0405transition = false
var screen0504transition = false
var screen0605transition = false
var screen0607transition = false
var screen0706transition = false
var screen0806transition = false
var screen0702transition = false
var screen0702transitionuntil02 = false
var screen0702transitionhappen = false
var screen0207transition = false
var screen0908transition = false

@export var speed = 400
var dev_mode = false
var player_move = true
var stop_player = 0
var talked = 0
var insideplyrarea = 0
var test_times = 0
var vanishs = false
var scene_runing = true
var player_attacked = false
var is_beging_attacked = false
var enemy_attack_position = Vector2(0,0)
var player_attack_position = Vector2(0,0)

var enemyposition0302
var enemyposition0302stored = false

var was_in_battle = false
var inside = false
var sl = 20
var long_fade = false
var show_ui = false
var ui_instanciated = false

var battle_win01 = false
var battle_win02 = false

var player_hit = false
var player_tiring = false
var player_tiring_time = 0.5

var dialogue_times_screen01_01 = 0

var talking_clothesscr05 = false
var talking_npc01scr05 = false
var talking_npc02scr05 = false
var npc02scr05_times = 0

var pass_0702_thing = false
var pass_0702_thing_once = false
var pass_0702_thing_once_true = false

@export var fullscreen = false

func _process(delta):
	
	if Input.is_action_pressed("full_screen") and fullscreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		await get_tree().create_timer(0.1).timeout
		fullscreen = false
		
		
	
	if Input.is_action_pressed("full_screen") and fullscreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		await get_tree().create_timer(0.1).timeout
		fullscreen = true
		
	
	
	if Input.is_key_pressed(KEY_0):
		room_save()
	if Input.is_key_pressed(KEY_1):
		room_load()

func room_save():
	
	var file2 = FileAccess.open(file, FileAccess.WRITE)
	file2.store_var(screen)
	

func room_load():
	if FileAccess.file_exists(file):
		var file2 = FileAccess.open(file, FileAccess.READ)
	else:
		screen = 0
