extends TileMap

var times = 0
@onready var animation_player = $AnimationPlayer

func fade_in():
	animation_player.play("fade_in")
	

func desapear():
	modulate.a = 0.00
