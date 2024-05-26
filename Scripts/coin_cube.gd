extends AnimatedSprite2D

signal player_active_block

var is_empty = false

func _on_buttom_detector_body_entered(body):
	if !is_empty: 
		is_empty = true
		if body.name == "Player":
			play("empty")
			player_active_block.emit()
