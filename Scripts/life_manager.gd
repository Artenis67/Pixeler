extends Node

@export var life_label: RichTextLabel

@export var max_life = 3
var current_life
var min_life

var can_be_hit = true

func _ready():
	current_life = max_life

func deincrease_life(amount: int):
	current_life -= amount
	update_ui_life()
	get_parent().invisibility_after_take_damage()
	
	can_be_hit = false
	await get_tree().create_timer(3.0).timeout
	can_be_hit = true

func _process(delta):
	print(current_life)

func update_ui_life():
	life_label.text = "Life : " + str(current_life)
