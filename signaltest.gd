extends Area2D

#signal hello
#@export var dialogue_resource: DialogueResource
var start = "npctest"
#var in_player = false
#var player_in_area = false
#
#func _process(delta):
#	if in_player == true and Input.is_action_just_pressed("accept"):
#		hello.emit()
#		DialogueManager.show_dialogue_balloon(dialogue_resource, start)
#		Global.player_move = false
#		in_player = false
#		
#	
#	if Global.player_move == true:
#		in_player = true
#	if Global.player_move == false:
#		in_player = false
#		#wait get_tree().create_timer(0.1).timeout
#		#in_player = false
#
#func _on_area_entered(area):
#	if area.is_in_group("player_front"): # and Input.is_action_just_pressed("accept")#
#		in_player = true
#		player_in_area = true
#	
#
#func _on_area_exited(area):
#	#if area.is_in_group("player_front"):
#	in_player = false
#	player_in_area = false
#	


@export var dialogue_resource: DialogueResource
var times = 0

func _process(delta):
	#test:
	while Global.stop_player == 0 and Input.is_action_just_pressed("accept") and Global.insideplyrarea == 1 and Global.talked == 0:
		Global.stop_player = 1
		Global.player_move = false
		Global.talked = 1
		Global.test_times += 1
		if Global.test_times == 1:
			DialogueManager.show_dialogue_balloon(dialogue_resource, start)
		if Global.test_times >= 2:
			DialogueManager.show_dialogue_balloon(dialogue_resource, "npctest2")

func _on_area_2d_area_entered(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		if Global.stop_player == 0:
			Global.insideplyrarea = 1


func _on_area_2d_area_exited(area):
	if area.is_in_group("player_front") or area.is_in_group("Player"):
		Global.insideplyrarea = 0
