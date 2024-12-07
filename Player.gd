extends CharacterBody2D

## Variables


@export var accel: float = 60
@export var up = false
@export var down = false
@export var left = false
@export var right = false
@export var can_run = true
@onready var animation_player = %AnimationPlayer
@onready var camera_2d = $"../../Camera2D"
@onready var player_camera = $"player camera"
@onready var fadeinout = $"../../fadeinout"
@onready var fadeinoutanimation = $"../../fadeinout/fadeinoutanimation"
@onready var _02_01_spawn = $"../../02-01spawn"
@onready var _01_02_spawn = $"../../01-02spawn"
@onready var _03_02_spawn = $"../../03-02spawn"
@onready var _04_03_spawn = $"../0403spawn"
@onready var _05_04_spawn = $"../../0504spawn"
@onready var _06_05_spawn = $"../../0605spawn"
@onready var _06_07_spawn = $"../../0607spawn"
@onready var _07_06_spawn = $"../../0706spawn"
@onready var _08_06_spawn = $"../../0806spawn"
@onready var _07_02_spawn = $"../../0702spawn"
@onready var _02_07_spawn = $"../../0207spawn"
@onready var _09_08_spawn = $"../../0908spawn"

@onready var player_sprite = $Sprite2D
@onready var player_area2d_colisionshape = $Area2D/CollisionShape2D

var multtime = false

#region Moviment

func _physics_process(delta):
	#moviment
	if Global.stop_player == 1 or Global.scene_runing == false:
		pass
	else:
		
		
		
		var direction = Input.get_vector("move_left","move_right","move_up","move_down")
		
		

		#smooth
		
		
		if can_run == true and Input.is_action_pressed("run"):
			velocity *= 1
			
#			if multtime == false:
#				velocity *= 2
#			if multtime == true:
#				velocity *= 0.5
#				multtime = false
#			multtime = true
		else:
#			if Global.dev_mode != true:
#				
			velocity *= 1.3
			
#				
			
		
		
		velocity.x = move_toward(velocity.x, Global.speed * direction.x, accel)
		velocity.y = move_toward(velocity.y, Global.speed * direction.y, accel)
		
		
		
		if can_run == true and Input.is_action_pressed("run"):
			pass
#			velocity *= 2
		else:
			velocity /= 1.3
#			if Global.dev_mode != true:
#				velocity *= 1
#		
#				
#			

		move_and_slide()


#endregion

func _ready():
	if Global.inside == true:
		var new_inside_colision = load("res://inside_colision.tscn")
		var instance = new_inside_colision.instantiate()
		add_child(instance)
	
	if Global.screen0102transition == true:
		position = _01_02_spawn.position
		camera_2d.position = _01_02_spawn.position
		Global.screen0102transition = false
		
	if Global.screen0201transition == true:
		Fade.fade_out()
		position = _02_01_spawn.position
		camera_2d.position = _02_01_spawn.position
		Global.screen0201transition = false
		
	if Global.screen0302transition == true:
		Fade.fade_out()
		position = _03_02_spawn.position
		camera_2d.position = _03_02_spawn.position
		Global.screen0302transition = false
		
	if Global.screen0403transition == true:
		
		Fade.fade_out()
		position = _04_03_spawn.position
		#camera_2d.position = _04_03_spawn.position
		Global.screen0403transition = false
	if Global.screen0405transition == true:
		
		Fade.fade_out()
		Global.screen0405transition = false
	if Global.screen0504transition == true:
		
		Fade.fade_out()
		position = _05_04_spawn.position
		Global.screen0504transition = false
	if Global.screen0605transition == true:
		
		Fade.fade_out()
		position = _06_05_spawn.position
		Global.screen0605transition = false
		
	if Global.screen0504transition == true:
		
		Fade.fade_out()
		position = _06_07_spawn.position
		Global.screen0607transition = false
		
	if Global.screen0706transition == true:
		
		Fade.fade_out()
		position = _07_06_spawn.position
		Global.screen0706transition = false
		
	if Global.screen0806transition == true:
		
		Fade.fade_out()
		position = _08_06_spawn.position
		Global.screen0806transition = false
		
	if Global.screen0702transition == true:
		
		Fade.fade_out()
		position = _07_02_spawn.position
		Global.screen0702transition = false
		
	if Global.screen0207transition == true:
		
		Fade.fade_out()
		position = _02_07_spawn.position
		Global.screen0207transition = false
		
	if Global.screen0908transition == true:
		
		Fade.fade_out()
		position = _09_08_spawn.position
		Global.screen0908transition = false
func _process(delta):
	
	if Global.player_attacked == true:
		#animation_player.stop()
		if Global.player_attacked == true:
			animation_player.play("attacked")
		Global.player_attacked = false
	if Global.stop_player == 1 or Global.scene_runing == false:
		pass
	else:
		
		#region Animations
		if Global.inside == false:
			player_sprite.scale = Vector2(3,3)
			$player_shadow.modulate.a = 0.56
			$CollisionShape2D.shape.size = Vector2(35, 27)
			$CollisionShape2D.position = Vector2(0.5, -17)
			$Area2D/CollisionShape2D.shape.size = Vector2(43, 34)
			$Area2D/CollisionShape2D.position = Vector2(1.5, 11)
			if Input.is_action_pressed("move_up"):
				animation_player.play("up")
				up = true
				down = false
				left = false
				right = false
			else:
				
				if Input.is_action_pressed("move_down"):
					animation_player.play("down")
					up = false
					down = true
					left = false
					right = false
				else:
					
					if Input.is_action_pressed("move_left"):
						animation_player.play("left")
						up = false
						down = false
						left = true
						right = false
					else:
						
						if Input.is_action_pressed("ui_right"):
							animation_player.play("right")
							up = false
							down = false
							left = false
							right = true
						else:
							if up == true:
								animation_player.play("Reset up")
							if down == true:
								animation_player.play("Reset down")
							if left == true:
								animation_player.play("Reset left")
							if right == true:
								animation_player.play("Reset right")
		if Global.inside == true:
			$CollisionShape2D.shape.size = Vector2(57, 45)
			$CollisionShape2D.position = Vector2(0, -28)
			$Area2D/CollisionShape2D.shape.size = Vector2(66, 61)
			$Area2D/CollisionShape2D.position = Vector2(1,-1)
			player_sprite.frame_coords.x = 21
			player_sprite.scale = Vector2(2.7,2.7)
			$player_shadow.modulate.a = 0.00

#endregion
