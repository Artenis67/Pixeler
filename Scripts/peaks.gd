extends Area2D

@export var damages = 1

func cause_damage_to_player(player):
	var player_life_manager = player.get_node("life_manager")
	
	if player_life_manager.can_be_hit:
		player_life_manager.deincrease_life(damages)
		
		$hit_particules.did_one_animation()

func _on_body_entered(body):
	if body.get_name() == "Player":
		print("Enemy touch")
		cause_damage_to_player(body)
