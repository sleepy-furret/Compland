extends CharacterBody2D

@onready var nav = $NavigationAgent2D

@export var scene_attack: String

var speed = 150
var accel = 7
var moving = true
var selfposition: Vector2
@onready var player = $"../ysorting/Player"
@onready var animation_player = $AnimationPlayer
var dying = false
var player_in_range = false

var up = false
var down = false
var right = false
var left = false

func _ready():
	if Global.battle_win02 == true:
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
	if moving == true and Global.scene_runing == true and area.is_in_group("Player") and player_in_range == true:
		
		if up == true:
			position.x += 60
		if down == true:
			position.x -= 120
		if left == true:
			position.y += 60
		if right == true:
			position.y -= 120
		position.y += randf_range(-60, 60)
		velocity.x = move_toward(velocity.x, speed * position.x, accel)
		velocity.x = move_toward(velocity.y, speed * position.y, accel)
		player_in_range = false
		
		if $".":
			if Global.inside == true:
				Global.sl -= 10
			if Global.inside == false:
				Global.sl -= 2
				
		



func _on_left_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("left")
		up = false
		down = false
		right = false
		left = true
		


func _on_up_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("up")
		up = true
		down = false
		right = false
		left = false


func _on_down_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("down")
		up = false
		down = true
		right = false
		left = false


func _on_right_area_entered(area):
	if area.is_in_group("Player") and dying != true:
		animation_player.play("right")
		up = false
		down = false
		right = true
		left = false





func player_on_range(area):
	if area.is_in_group("Player"):
		player_in_range = true


func player_exited_range(area):
	if area.is_in_group("Player"):
		player_in_range = false
