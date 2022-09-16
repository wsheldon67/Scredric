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
	player.player_number = player_parent.get_child_count()
	
	# Add Player to Camera
	var camera = get_node("/root/Main/MultiCamera")
	camera.add_target(player)


func get_closest_player(target_position):
	var players = get_tree().get_nodes_in_group("players")
	var closest = players[0]
	for player in players:
		var curr_dist = player.position.distance_to(target_position)
		var prev_closest = closest.position.distance_to(target_position)
		if curr_dist < prev_closest and !player.dead:
			closest = player
	if closest.dead:
		return false
	return closest


func _ready():
	get_tree().paused = true


func game_over():
	MENU.change_menu("GameOver")
	MENU.show()


func restart_level():
	
	# reset progress
	var save_file = "user://savegame%s.save" % PROGRESS.save_slot
	var save_game = File.new()
	if save_game.file_exists(save_file):
		save_game.open(save_file, File.READ)
		var save_data = parse_json(save_game.get_line())
		PROGRESS.data = save_data
	else:
		PROGRESS.data = PROGRESS.initial
	
	# reset players
	for player in get_tree().get_nodes_in_group("players"):
		player.reset_stats()
		player.dead = false
	
	# reset HUD
	HUD.reset()
	
	# reload level
	change_level(PROGRESS.data.current_level)
