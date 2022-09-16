extends "res://assets/mobs/Enemy.gd"

var speed = 50
var speed_mod = 1
var direction = 1

func _physics_process(delta):
	var player_position = WORLD.get_closest_player(position).position
	var m = direction * speed_mod
	if player_position.x > position.x:
		position.x += speed * delta * m
	else:
		position.x -= speed * delta * m
	if player_position.y > position.y:
		position.y += speed * delta * m
	else:
		position.y -= speed * delta * m

