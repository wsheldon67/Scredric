extends Button

export var weapon_name = "Pistol"
export var mk1_texture:Texture
export var mk2_texture:Texture

signal gun_selected

func _ready():
	if PROGRESS.data.weapons[weapon_name] == 0:
		queue_free()
	elif PROGRESS.data.weapons[weapon_name] == 1:
		icon = mk1_texture
	elif PROGRESS.data.weapons[weapon_name] == 2:
		icon = mk2_texture


func _on_GunButton_pressed():
	disabled = true
	emit_signal("gun_selected", weapon_name)


func set_weapon(new_name):
	weapon_name = new_name
	disabled = false
	icon = get_node("/root/Main/Menu/ChooseCombinator/Guns/"+new_name).icon
