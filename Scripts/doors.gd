extends Node2D


@export var door_1: Area2D
@export var door_2: Area2D

var can_interact_with_door_1 = false
var can_interact_with_door_2 = true

var player


func _unhandled_input(event):
	if event is InputEventKey:
		print("Move up detected1")
		if event.is_action_pressed("joystick_up"):
			print("Move up detected2")
			if (can_interact_with_door_1):
				teleport_to_door_2()
				print("goto tp P2")
			elif(can_interact_with_door_2):
				teleport_to_door_1()
				print("goto tp P1")


func teleport_to_door_2():
	if(can_interact_with_door_1):
		player.position = $Door2.position

func teleport_to_door_1():
	if(can_interact_with_door_2):
		player.position = $Door1.position
		

func _on_door_1_body_entered(body):
	if body.get_name() == "Player":
		can_interact_with_door_1 = true
		
		player = body
		
		print("Player on door1")

func _on_door_2_body_entered(body):
	if body.get_name() == "Player":
			can_interact_with_door_2 = true
			
			print("Player on door2")

func _on_door_1_body_exited(body):
	if body.get_name() == "Player":
		can_interact_with_door_1 = false

func _on_door_2_body_exited(body):
	if body.get_name() == "Player":
		can_interact_with_door_2 = false
