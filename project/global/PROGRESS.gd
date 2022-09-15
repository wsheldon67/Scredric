extends Node

var save_slot = 1

var data = {
	"current_level": "Level 1",
	"chosen_difficulty": 0,
	"weapons": {
		"Pistol": 0
	},
	"unlocks": {
		"combinator": 0,
		"extra_health": 0
	}
}

func save():
	var save_game = File.new()
	save_game.open("user://savegame%s.save" % str(save_slot), File.WRITE)
	save_game.store_line(to_json(data))
