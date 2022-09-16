extends Node

onready var config = ConfigFile.new()

func _ready():
	load_config()

func load_config():
	var err = config.load("user://config.ini")
	if err != OK:
		return
	
	# reset keys from config
	for key in config.get_section_keys("keybinds"):
		var scancode = config.get_value("keybinds", key)
		if scancode:
			var ev = InputEventKey.new()
			ev.scancode = scancode
			change_key(key, ev)


func change_key(action_string, new_key):
	var inputs = InputMap.get_action_list(action_string)
	
	# delete existing key
	if !inputs.empty():
		InputMap.action_erase_event(action_string, inputs[0])
	
	# assign new key
	InputMap.action_add_event(action_string, new_key)
	config.set_value("keybinds", action_string, new_key.scancode)
	save()


func save():
	config.save("user://config.ini")
