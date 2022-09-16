extends Node2D

var selected = 1
signal player_selected

func select_player(player_number):
	get_node("Button" + str(selected)).disabled = false
	get_node("Button" + str(player_number)).disabled = true
	selected = player_number
	emit_signal("player_selected", player_number)


func _on_Button1_pressed():
	select_player(1)

func _on_Button2_pressed():
	select_player(2)

func _on_Button3_pressed():
	select_player(3)

func _on_Button4_pressed():
	select_player(4)
