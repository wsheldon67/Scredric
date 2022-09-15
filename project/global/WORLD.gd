extends Node


func change_level(level_name):
	var level_parent = get_node("/root/Main/World/Level")
	# Delete existing level
	var current_level = level_parent.get_child(0)
	current_level.queue_free()
	# Load new level
	var new_level = ResourceLoader.load("res://levels/%s.tscn" % level_name).instance()
	level_parent.add_child(new_level)

func add_player():
	var player = ResourceLoader.load("res://assets/player/Player.tscn").instance()
	var player_parent = get_node("/root/Main/World/Players")
	player_parent.add_child(player)
