extends CanvasLayer



func _on_Back_pressed():
	MENU.change_menu("StartMenu")


func _on_player_added(player_number):
	$Ready.disabled = false
	if player_number < 4:
		var next_player = get_node("./BlankPlayer%s" % str(player_number+1))
		next_player.enable()
		WORLD.add_player()


func _on_Ready_pressed():
	MENU.change_menu("SelectSave")

# FIXME same session new game still has old players
