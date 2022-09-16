extends KinematicBody2D

export var player_number:int = 1

# movement
var speed = 200
var jump_force = 640
var gravity = 1200

# stats
var max_health = 3
var health = 3

# function
var vel = Vector2()
var dead = false
var spawn_increase = 5
var starting_spawn_timer = 5
var spawn_timer = starting_spawn_timer

func reset_stats():
	health = max_health


func take_hit(damage):
	health -= damage
	HUD.take_hit(player_number, health)
	if health <= 0:
		die()


func die():
	# TODO make dead sprite
	dead = true
	if all_players_are_dead():
		WORLD.game_over()
		return
	$RespawnTimer.start()
	$RespawnDisplay.visible = true


func all_players_are_dead():
	for player in get_tree().get_nodes_in_group("players"):
		if player.dead == false:
			return false
	return true

func _physics_process(delta):
	if dead:
		return
	# reset horizontal velocity
	vel.x = 0
	
	# movement inputs
	if Input.is_action_pressed("move_left_" + str(player_number)):
		vel.x -= speed
	if Input.is_action_pressed("move_right_" + str(player_number)):
		vel.x += speed
	
	# apply velocity
	vel = move_and_slide(vel, Vector2.UP)
	# gravity
	vel.y += gravity * delta
	
	# jump input
	if Input.is_action_pressed("jump_" + str(player_number)) and is_on_floor():
		vel.y -= jump_force
		# TODO partial jumps
		# TODO wall jumps
	
	# flip sprite
	if vel.x < 0:
		$AnimatedSprite.flip_h = true
	if vel.x > 0:
		$AnimatedSprite.flip_h = false

func _on_RespawnTimer_timeout():
	$RespawnDisplay.text = str(spawn_timer)
	spawn_timer -= 1
	if spawn_timer < 0:
		revive()

func revive():
	$RespawnDisplay.visible = false
	$RespawnTimer.stop()
	starting_spawn_timer += spawn_increase
	spawn_timer = starting_spawn_timer
	health = max_health
	dead = false
	
