extends Area2D

func _ready():
	$AnimatedSprite2D.play("idle")

func _on_body_entered(body):
	if body.get_name() == "Player":
		var score_manager = body.get_node("score-manager")
		if score_manager:
			score_manager.score += 1
			score_manager.score_ui_update()
		queue_free()
