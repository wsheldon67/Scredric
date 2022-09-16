extends CanvasLayer

func _on_Start_pressed():
	MENU.change_menu("AddPlayers")


func _on_Settings_pressed():
	MENU.change_menu("KeyBindings")


func _on_Quit_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
