extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -170.0
const MAX_JUMP_TIME = 0.2  # Durée maximale du saut (en secondes)
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") - 1

var jump_time = 0.0
var is_jumping = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump start.
	if Input.is_action_just_pressed("xbox_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = true
		jump_time = 0.0

	# Handle jump hold.
	if is_jumping:
		if Input.is_action_pressed("xbox_jump") and jump_time < MAX_JUMP_TIME:
			jump_time += delta
			velocity.y = JUMP_VELOCITY  # Continue applying the initial jump velocity
		else:
			is_jumping = false

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	# Animation handling.
	if direction <= -0.1:
		$AnimatedSprite2D.play("run", direction)
		$AnimatedSprite2D.flip_h = false
	elif direction >= 0.1:
		$AnimatedSprite2D.play("run", direction)
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("idle")

	move_and_slide()

# Reset jump when landing
func _on_FloorDetection_body_entered(body):
	is_jumping = false

func invisibility_after_take_damage():
	var player_sprite = $AnimatedSprite2D
	
	for i in range(3):
		player_sprite.modulate = Color(1, 1, 1, 0.5)
		await get_tree().create_timer(0.5).timeout
		player_sprite.modulate = Color(1, 1, 1, 1)
		await get_tree().create_timer(0.5).timeout


func level_ended():
	print("Level finished ! Votre socre est de : ", get_node("score-manager").score)
