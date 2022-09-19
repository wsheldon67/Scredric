extends KinematicBody2D

export var speed:int = 400
export var proj_range:int = 400
export var damage:int = 1
export var n = "1"

var direction:Vector2 = Vector2(0,0)

func _ready():
	if Input.is_action_pressed("shoot_right_"+n):
		direction.x += 1
	if Input.is_action_pressed("shoot_left_"+n):
		direction.x -= 1
	if Input.is_action_pressed("shoot_up_"+n):
		direction.y -= 1
	if Input.is_action_pressed("shoot_down_"+n):
		direction.y += 1
	if direction.x == 0 and direction.y == 0:
		direction.x = 1
	direction = direction.normalized()

func _physics_process(delta):
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		if collision.collider.is_in_group("Enemy"):
			collision.collider.take_hit(damage)
		queue_free()
