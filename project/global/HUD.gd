extends CanvasLayer

func reset():
	reset_unlocks()
	reset_players()
	reset_player_hud()

func reset_unlocks():
	# match HUD to current progress
	for weapon in PROGRESS.data.weapons.keys():
		unlock(weapon, PROGRESS.data.weapons[weapon])


func reset_players():
	for player in get_tree().get_nodes_in_group("players"):
		set_health(player.player_number, player.health)


func reset_max_health():
	for player_hud in get_tree().get_nodes_in_group("playerHUD"):
		player_hud.set_max_health(PROGRESS.data.unlocks.extra_health + 3)


func reset_player_hud():
	for player_hud in get_tree().get_nodes_in_group("playerHUD"):
		player_hud.hide_if_no_player()


func set_health(player_number, health):
	# update player health
	var player_node = get_node("/root/Main/HUD/PlayerHUD" + str(player_number))
	player_node.set_health(health)


func unlock(unlock_name, unlock_level):
	if unlock_level == 0:
		return
	var unlock_node
	if !has_node(unlock_name):
		var path = "res://assets/game/hotbar/%s.tscn" % unlock_name
		unlock_node = ResourceLoader.load(path).instance()
		add_child(unlock_node)
	else:
		unlock_node = get_node(unlock_name)
	unlock_node.set_level(unlock_level)


func show():
	get_node("/root/Main/HUD").visible = true

func hide():
	get_node("/root/Main/HUD").visible = false
