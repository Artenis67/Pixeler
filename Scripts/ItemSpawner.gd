extends Node2D

@export var coin_scene: PackedScene = preload("res://Scene/Objects/coin.tscn")

func summon_coin():
	var new_coin = coin_scene.instantiate()
	
	var coin_path_follow = $Path2D/PathFollow2D
	if coin_path_follow:
		coin_path_follow.add_child(new_coin)
		new_coin.position = Vector2.ZERO 
	else:
		print("PathFollow2D node not found!")
