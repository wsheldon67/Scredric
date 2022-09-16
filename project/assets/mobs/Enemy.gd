extends Node2D

var health = 3

func take_hit(damage):
	health -= damage
	if health <= 0:
		queue_free()
