extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _spike_on(area):
	if area.is_in_group("Player"):
		Global.sl -= 5
		Sounds.play_hurt01_sound()
