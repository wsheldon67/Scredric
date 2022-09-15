extends Node

onready var menu_parent = get_node("/root/Main/Menu")

func change_menu(menu_name):
	call_deferred("_change_menu", menu_name)

func _change_menu(menu_name):
	# Remove current menu
	menu_parent.remove_child(menu_parent.get_child(0))
	# Add new menu
	var new_menu = ResourceLoader.load("res://menus/%s.tscn" % menu_name).instance()
	menu_parent.add_child(new_menu)

func hide():
	menu_parent.get_child(0).visible = false

func show():
	menu_parent.get_child(0).visible = true
