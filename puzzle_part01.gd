extends Area2D

var press_times = 0

@onready var sprite_2d = $Sprite2D

func _ready():
	press_times = 0
	
	sprite_2d.frame_coords.x
	

func _on_area_entered(area):
	pass # Replace with function body.
