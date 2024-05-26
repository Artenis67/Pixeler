extends Node2D

var simultaneous_scene = preload("res://Scene/main_scene.tscn").instantiate()

func credit_button():
	print("Game by Artenis67
		Assets by Kenney")

func play_button():
	get_tree().change_scene_to_file("res://Scene/main_scene.tscn")

func quit_button():
	get_tree().quit()
