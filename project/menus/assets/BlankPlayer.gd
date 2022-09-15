extends Node2D


export var player_number:int = 1
export var disabled:bool = true

signal player_added


func _ready():
	$Label.text = "Player " + str(player_number)
	$Button.disabled = disabled

func _on_Button_pressed():
	emit_signal("player_added", player_number)
	$Button.disabled = true
	$Button.text = "Joined"

func enable():
	$Button.disabled = false
