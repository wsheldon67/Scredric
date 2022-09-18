extends Node2D

export var player_number = 1

onready var weapon_name = get_node("../..").weapon_name

func _ready():
	$Label.text = str(player_number)
	# match player color, but translucent
	$Sprite.modulate = "55" + CONFIG.player_colors[player_number-1]
