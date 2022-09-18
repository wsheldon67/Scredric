extends Node2D

export var weapon_name = "Pistol"


func set_player(player_number):
	var player_tab = get_node("PlayerTabs/PlayerTab%s" % str(player_number))
	player_tab.visible = true

func remove_player(player_number):
	var player_tab = get_node("PlayerTabs/PlayerTab%s" % str(player_number))
	player_tab.visible = false
