extends Node2D

export var save_number:int = 1
var save_data
var chosen_difficulty = 0

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
	get_tree().paused = false


func _on_Easy_pressed():
	chosen_difficulty = 0
	if $Load.disabled:
		do_it()
	else:
		$Confirm.visible = true
	
func _on_Hard_pressed():
	chosen_difficulty = 1
	if $Load.disabled:
		do_it()
	else:
		$Confirm.visible = true


func start_game():
	PROGRESS.save_slot = save_number
	PROGRESS.data = PROGRESS.initial.duplicate()
	PROGRESS.save()
	MENU.hide()
	WORLD.change_level("Level 1")
	get_tree().paused = false


func do_it():
	PROGRESS.data.chosen_difficulty = chosen_difficulty
	start_game()

func _on_Back_pressed():
	$Confirm.visible = false
