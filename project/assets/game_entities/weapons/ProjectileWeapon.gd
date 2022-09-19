extends Node2D

export var projectile_name = "PistolBullet"
export var rate_of_fire = 0.5

var shooting = false
var cooling = false

onready var projectile = load("res://assets/game_entities/weapons/projectiles/"+projectile_name+".tscn")
onready var player = get_node("../..")
onready var n = str(player.player_number)
onready var level = get_node("/root/Main/World").get_child(0)

func _ready():
	$Timer.wait_time = rate_of_fire
	$Cooldown.wait_time = rate_of_fire

func _process(event):
	if Input.is_action_pressed("shoot_left_"+n) or Input.is_action_pressed("shoot_right_"+n) or Input.is_action_pressed("shoot_up_"+n) or Input.is_action_pressed("shoot_down_"+n):
		if !shooting:
			start_shooting()
	else:
		if shooting:
			stop_shooting()

func stop_shooting():
	shooting = false
	cooling = true
	$Timer.stop()
	$Cooldown.start()

func start_shooting():
	shooting = true
	if !cooling:
		spawn_projectile()
	$Timer.start()

func spawn_projectile():
	var spawned_projectile = projectile.instance()
	spawned_projectile.position = player.position
	spawned_projectile.n = n
	level.add_child(spawned_projectile)


func _on_Cooldown_timeout():
	cooling = false
