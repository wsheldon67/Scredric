extends KinematicBody2D

export var player_number:int = 1

# movement
var speed = 200
var jump_force = 640
var gravity = 1200
var wall_jump = true

# stats
var max_health = 3
var health = 3

# weapon
var current_weapon = ""

# function
var vel = Vector2()
var dead = false
var spawn_increase = 5
var initial_spawn_timer = 5
var starting_spawn_timer = initial_spawn_timer
var spawn_timer = initial_spawn_timer

func reset_stats():
	health = max_health
	starting_spawn_timer = initial_spawn_timer
	revive()

func take_hit(damage):
	health -= damage
	HUD.set_health(player_number, health)
	if health <= 0:
		die()


func die():
	$AnimatedSprite.play("dead")
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
	var peaked = vel.y - jump_force > - gravity
	var jumpable_surface = is_on_floor() or (is_on_wall() and wall_jump)
	if Input.is_action_pressed("jump_" + str(player_number)) and jumpable_surface and peaked:
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
		starting_spawn_timer += spawn_increase
		revive()

func revive():
	$RespawnDisplay.visible = false
	$RespawnTimer.stop()
	spawn_timer = starting_spawn_timer
	health = max_health
	$AnimatedSprite.play("default")
	dead = false


func change_weapon(weapon_name):
	if PROGRESS.data.weapons[weapon_name] > 0:
		# change HUD
		HUD.change_weapon(weapon_name, player_number)
		# remove existing weapons
		for player_weapon in $Weapons.get_children():
			player_weapon.queue_free()
		# add new weapon
		var new_weapon = ResourceLoader.load("res://assets/game_entities/weapons/"+weapon_name+".tscn").instance()
		$Weapons.add_child(new_weapon)

func _unhandled_input(event):
	if event.is_action_pressed("Pistol_" + str(player_number)):
		change_weapon("Pistol")


func remove_player():
	var m_camera = get_node("/root/Main/MultiCamera")
	m_camera.remove_target(self)
	queue_free()
