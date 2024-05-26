extends Node

@export var score = 0

func _process(delta):
	pass

func score_ui_update():
	var score_label = get_parent().get_node("score-label")
	score_label.text = "Score : " + str(score)
