extends CanvasLayer



func _on_Retry_pressed():
	MENU.hide()
	WORLD.restart_level()

func _on_Quit_pressed():
	MENU.change_menu("StartMenu")
