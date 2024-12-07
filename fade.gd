extends Node2D

@onready var fadeinoutanimation = %fadeinoutanimation
@onready var fadeinout = %fadeinout

func _ready():
	fadeinout.visible = false
	

func fade_in():
	fadeinout.visible = true
	fadeinoutanimation.play("fade_in")
	

func large_fade_in():
	fadeinout.visible = true
	fadeinoutanimation.play("3sfade_in")

func fade_out():
	fadeinout.visible = true
	fadeinoutanimation.play("fade_out")
	

func fadeinout_sprite_visible_off():
	fadeinout.visible = false
	

func fadeinout_sprite_visible_on():
	fadeinout.visible = true
	

func _on_fadeinoutanimation_animation_finished(anim_name):
	fadeinout.visible = true
	
