extends Node2D

export var disabled = false

signal weapon_pressed

func _ready():
	var dir = Directory.new()
	if dir.open("res://weapons") == OK:
		dir.list_dir_begin(true)
		var folder_name = dir.get_next()
		while folder_name != "":
			
			folder_name = dir.get_next()

func add_weapon(weapon_name):
	print(weapon_name)


func set_player(weapon_name, player_number):
	pass
