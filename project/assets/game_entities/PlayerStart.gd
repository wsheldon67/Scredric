extends Node2D

func _ready():
	var players = get_tree().get_nodes_in_group("players")
	for player in players:
		player.position = position
		player.reset_stats()
	$Sprite.queue_free()
