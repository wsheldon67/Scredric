extends CanvasLayer


func _ready():
	$PlayerSelect.select_player(1)


func _on_PlayerSelect_player_selected(player_number):
	for keybind in get_tree().get_nodes_in_group("keybind"):
		keybind.set_player_number(player_number)


func _on_Back_pressed():
	MENU.change_menu("StartMenu")
