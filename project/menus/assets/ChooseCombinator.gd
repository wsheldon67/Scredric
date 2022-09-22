extends CanvasLayer

func _on_gun_selected(weapon_name):
	if !$Combo1.weapon_name == "":
		$Combo1.set_weapon(weapon_name)
	else:
		$Combo2.set_weapon(weapon_name)


func _on_Combine_pressed():
	var weapon1 = $Combo1.weapon_name
	var weapon2 = $Combo2.weapon_name
	WORLD.combinators[weapon1].append(weapon2)
	WORLD.combinators[weapon2].append(weapon1)
	
