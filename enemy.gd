extends CharacterBody2D

@onready var nav = $NavigationAgent2D

@export var scene_attack: String

var speed = 300
var accel = 7
var moving = true
var selfposition: Vector2
@onready var player = $"../Player"
@onready var animation_player = $AnimationPlayer
var dying = false

func _ready():
	if Global.enemyposition0302stored == true:
		position = Global.enemyposition0302
		Global.enemyposition0302stored = false
	if Global.battle_win01 == true:
		if Global.was_in_battle == true:
			animation_player.play("death")
			position = Global.enemy_attack_position
			moving = false
			dying = true
			
			await get_tree().create_timer(2.7).timeout
		
		queue_free()

func _physics_process(delta):
	
	#selfposition = position
	#if Input.is_action_just_pressed("ui_accept"):
		#if moving == false:
			#moving = true
		#else:
			#moving = false
		#
	if moving == true and Global.scene_runing == true:
		var direction = Vector3()
		
		nav.target_position = player.position
		
		direction = nav.get_next_path_position() - global_position
		direction = direction.normalized()

		#if get_global_mouse_position() < Vector2(1, 1):
		velocity = velocity.lerp(direction * speed, accel * delta)
		
		
		move_and_slide()


func _on_area_2d_area_entered_player_with(area):
	if moving == true and Global.scene_runing == true and area.is_in_group("Player"):
		moving = false
		
		Global.player_attacked = true
		Global.is_beging_attacked = true
		Global.scene_runing = false
		Global.player_attack_position = player.position
		Global.enemy_attack_position = position
		await get_tree().create_timer(2.4).timeout
		Global.inside = true
		Sounds.stop_wind_sound()
		Global.show_ui = true
		if $".":
			get_tree().change_scene_to_file(scene_attack)
		
	


func _on_left_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("left")


func _on_up_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("up")


func _on_down_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("down")


func _on_right_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("right")

func _process(delta):
	if Global.screen0302transition == true:
		Global.enemyposition0302 = position
		Global.enemyposition0302stored = true
	
