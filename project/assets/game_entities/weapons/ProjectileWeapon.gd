extends Node2D

export var projectile_name = "PistolBullet"

onready var projectile = load("res://assets/game_entities/weapons/projectiles/"+projectile_name+".tscn")

func _unhandled_input(event):
	var player = get_node("../..")
	var n = str(player.player_number)
	if event.is_action_pressed("shoot_left_"+n) or event.is_action_pressed("shoot_right_"+n) or event.is_action_pressed("shoot_up_"+n) or event.is_action_pressed("shoot_down_"+n):
		var level = get_node("/root/Main/World").get_child(0)
		var spawned_projectile = projectile.instance()
		spawned_projectile.position = player.position
		spawned_projectile.n = n
		level.add_child(spawned_projectile)
