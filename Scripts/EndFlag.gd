extends Node2D

@export var next_level_scene: PackedScene

func _on_area_2d_body_entered(body):
	if body.get_name() == "Player":
		body.level_ended()
		go_next_level()

func go_next_level():
	if next_level_scene:
		get_tree().change_scene_to_packed(next_level_scene)
	else:
		print("Next level scene is not assigned.")
