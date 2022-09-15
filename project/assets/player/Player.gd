extends KinematicBody2D

export var player_number:int = 1

# movement
var speed = 200
var jump_force = 640
var gravity = 1200

var vel = Vector2()

# stats
var max_health = 3
var health = 3


func reset_stats():
	health = max_health


func _physics_process(delta):
	
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
