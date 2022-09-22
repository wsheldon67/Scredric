extends CanvasLayer



func _on_Button_pressed():
	print(PROGRESS.data.unlocks.combinator)
	if PROGRESS.data.unlocks.combinator > 0:
		MENU.change_menu("ChooseCombinator")
	else:
		MENU.hide()
		get_tree().paused = false
