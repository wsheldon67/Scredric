extends Node2D

var health = 3
export var min_difficulty = 0
export var spawn_distance = 600
var active = false

func take_hit(damage):
	health -= damage
	if health <= 0:
		queue_free()

func _ready():
	if PROGRESS.get_difficulty() < min_difficulty:
		queue_free()

func _process(_delta):
	# maybe optimize this later if its a problem
	var closest = WORLD.get_closest_player(position)
	if closest and closest.position.distance_to(position) < spawn_distance:
		active = true
