extends Area2D

@export var dialogue_resource: DialogueResource

func _on_dialogue01_screen01_area(area):
	if area.is_in_group("Player"):
		if Global.dialogue_times_screen01_01 == 0:
			Global.stop_player = 1
			DialogueManager.show_dialogue_balloon(dialogue_resource, "step")
		Global.dialogue_times_screen01_01 += 1
	
