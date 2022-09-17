extends Node2D

export var player_number = 1

var max_health = 3
var health = 3

func _ready():
	$Label.text = "Player" + str(player_number)


func hide_if_no_player():
	var num_players = get_tree().get_nodes_in_group("players").size()
	if num_players < player_number:
		visible = false
	else:
		visible = true

func set_health(new_health):
	health = new_health
	for i in range(1, 5, 1):
		var heart = get_node("Hearts/Heart%s" % i)
		if i <= health:
			heart.play("on")
		else:
			heart.play("off")

func set_max_health(new_health):
	max_health = new_health
	for i in range(1, 5, 1):
		var heart = get_node("Hearts/Heart%s" % i)
		if i <= max_health:
			heart.visible = true
		else:
			heart.visible = false

