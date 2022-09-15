extends Area2D

export var next_level = "Level 1"

func _on_LevelEnd_body_entered(body):
	if body.is_in_group("players"):
		get_tree().paused = true
		MENU.change_menu("LevelEnd")
		MENU.show()
		WORLD.change_level(next_level)
