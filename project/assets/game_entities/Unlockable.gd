extends Area2D

# weapons or unlocks
export var unlock_type = "weapons"
export var unlock_name = "Pistol"
export var level = 1

func _on_Unlockable_body_entered(body):
	if body.is_in_group("players"):
		unlock()


func unlock():
	PROGRESS.unlock(unlock_type, unlock_name, level)
	$Cage.queue_free()
	$GunSprite.queue_free()
	$CollisionShape2D.queue_free()
	# maybe some hotbar stuff
