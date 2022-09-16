extends "res://assets/mobs/Enemy.gd"

var speed = 50
var damage = 1
export var speed_mod = 1
export var direction = 1

var drifting = Vector2(0, 0)

func _physics_process(delta):
	if !active:
		return
	var player_position = position
	var closest_player = WORLD.get_closest_player(position)
	if closest_player:
		drifting = Vector2(0, 0)
		player_position = closest_player.position
	else:
		if !drifting:
			drifting.x = rand_range(-1, 1)
			drifting.y = rand_range(-1, 1)
		position.x += drifting.x * speed * delta
		position.y += drifting.y * speed * delta
		return
	var m = direction * speed_mod
	if player_position.x > position.x:
		position.x += speed * delta * m
	else:
		position.x -= speed * delta * m
	if player_position.y > position.y:
		position.y += speed * delta * m
	else:
		position.y -= speed * delta * m


func _on_RedStar_body_entered(body):
	if body.is_in_group("players"):
		body.take_hit(damage)
		$AnimationPlayer.queue("Attack")
