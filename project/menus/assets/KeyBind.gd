extends Node2D

export var label = ""
export var input_map_action = ""
var current_player
var edit_mode = false

func _ready():
	$Label.text = label

func set_player_number(player_number):
	current_player = player_number
	var inputs = InputMap.get_action_list(input_map_action + str(player_number))
	if inputs.size() > 0:
		$Button.text = inputs[0].as_text()
	else:
		$Button.text = "**"


func _on_Button_pressed():
	edit_mode = true
	$Button.text = ".."

func _input(event):
	if event is InputEventKey and edit_mode:
		var action_string = input_map_action + str(current_player)
		CONFIG.change_key(action_string, event)
		# update button text
		$Button.text = event.as_text()
		edit_mode = false
