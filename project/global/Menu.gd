extends Node

func change_menu(menu_name):
	call_deferred("_change_menu", menu_name)

func _change_menu(menu_name):
	# Remove current menu
	var menu_parent = get_node("/root/Main/Menu")
	menu_parent.remove_child(menu_parent.get_child(0))
	# Add new menu
	var new_menu = ResourceLoader.load("res://menus/%s.tscn" % menu_name).instance()
	menu_parent.add_child(new_menu)
