extends Area2D

@onready var gate_01 = $"../Y Sorting/gate01"


func _on_area_entered(area):
	if area.is_in_group("Player"):
		$"../TileMap".visible = true
		gate_01.visible = true
		Global.pass_0702_thing = true
		Global.pass_0702_thing_once = true
		
