extends AnimatedSprite2D

func did_one_animation():
	visible = true
	play("default")
	await get_tree().create_timer(0.55).timeout
	visible = false
	stop()
