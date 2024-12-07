extends Node2D

@onready var text: Label = %text
@onready var text_2: Label = %text2
@onready var text_2_stop: Marker2D = $text2_stop

func _ready() -> void:
	Fade.fade_out()
	
	await get_tree().create_timer(55.0).timeout
	
	Fade.fade_in()
	

func _process(delta: float) -> void:
	text.position.y -= 0.5
	if text_2_stop.position != text_2.position:
		text_2.position.y -= 0.5
		
