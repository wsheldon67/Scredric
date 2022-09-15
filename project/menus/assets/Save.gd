extends Node2D

export var save_number:int = 1
var save_data

func _ready():
	# Is there a save file?
	var save_file = "user://savegame%s.save" % save_number
	var save_game = File.new()
	if save_game.file_exists(save_file):
		# If there is, display the most recently completed level.
		$Load.disabled = false
		save_game.open(save_file, File.READ)
		save_data = parse_json(save_game.get_line())
		$Label.text = save_data.current_level



func _on_Load_pressed():
	PROGRESS.data = save_data
	MENU.hide()
	WORLD.change_level(save_data.current_level)



func _on_Easy_pressed():
	start_game()
func _on_Hard_pressed():
	PROGRESS.data.choosen_difficulty = 1
	start_game()

func start_game():
	PROGRESS.save_slot = save_number
	MENU.hide()
	WORLD.change_level("Level 1")
