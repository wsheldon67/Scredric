extends Node2D

export var weapon_name = "Pistol"
export var mk1_texture:Texture
export var mk2_texture:Texture

func set_player(player_number):
	var player_tab = get_node("PlayerTabs/PlayerTab%s" % str(player_number))
	player_tab.visible = true

func remove_player(player_number):
	var player_tab = get_node("PlayerTabs/PlayerTab%s" % str(player_number))
	player_tab.visible = false

func set_level(level):
	print(weapon_name, level)
	if level == 0:
		visible = false
	elif level == 1:
		$Sprite.texture = mk1_texture
		visible = true
	elif level == 2:
		$Sprite.texture = mk2_texture
		visible = true
	else:
		print("Invalid weapon level: ", level)

# FIXME switching to gun when already set removes tab
