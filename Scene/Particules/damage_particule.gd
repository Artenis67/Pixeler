extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")


func _on_animation_looped():
	queue_free()
