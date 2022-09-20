extends "res://assets/mobs/Enemy.gd"

var speed = 50
var damage = 1
export var speed_mod = 1
export var direction = 1

func _physics_process(_delta):
	if !active:
		return
	var player_position = position
	var closest_player = WORLD.get_closest_player(position)
	if closest_player:
		player_position = closest_player.position
	else:
		return
	var m = direction * speed_mod
	var heading = player_position - position
	var collision = move_and_collide(m * heading.normalized())
	if collision:
		var body = collision.collider
		if body.is_in_group("players"):
			body.take_hit(damage)
			$AnimationPlayer.queue("Attack")
