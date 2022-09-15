extends CanvasLayer



func _on_Back_pressed():
	Menu.change_menu("StartMenu")


func _on_player_added(player_number):
	$Ready.disabled = false
	if player_number < 4:
		var next_player = get_node("./BlankPlayer%s" % str(player_number+1))
		next_player.enable()


func _on_Ready_pressed():
	pass # Replace with function body.
