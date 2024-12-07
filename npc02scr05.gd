extends StaticBody2D

@export var dialogue_resource: DialogueResource
var times = 0

func _process(delta):
	#test:
	while Global.stop_player == 0 and Input.is_action_just_pressed("accept") and Global.insideplyrarea == 1 and Global.talked == 0 and Global.talking_npc02scr05 == true:
		Global.stop_player = 1
		Global.player_move = false
		Global.talked = 1
		Global.npc02scr05_times += 1
		if Global.npc02scr05_times == 1:
			DialogueManager.show_dialogue_balloon(dialogue_resource, "npc02")
		if Global.npc02scr05_times >= 2:
			DialogueManager.show_dialogue_balloon(dialogue_resource, "npc02twice")

func _on_area_2d_area_entered(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		if Global.stop_player == 0:
			Global.insideplyrarea = 1
			Global.talking_npc02scr05 = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		Global.insideplyrarea = 0
		Global.talking_npc02scr05 = false
