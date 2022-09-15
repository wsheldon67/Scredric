extends Node

func change_level(level_name):
	call_deferred("_change_level", level_name)

func _change_level(level_name):
	var level_parent = get_node("/root/Main/World/Level")
	# Delete existing level
	level_parent.remove_child(level_parent.get_child(0))
	# Load new level
	var new_level = ResourceLoader.load("res://levels/%s.tscn" % level_name).instance()
	level_parent.add_child(new_level)


func add_player():
	
	# Add Player to World
	var player = ResourceLoader.load("res://assets/player/Player.tscn").instance()
	var player_parent = get_node("/root/Main/World/Players")
	player_parent.add_child(player)
	
	# Add Player to Camera
	var camera = get_node("/root/Main/MultiCamera")
	camera.add_target(player)
