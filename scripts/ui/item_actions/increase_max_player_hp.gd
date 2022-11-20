extends Node


func _init() -> void:
	if Globals.player:
		var inc = ItemOptions.get("increase_hp")
		Globals.player.max_health += inc
		Globals.player.heal(inc)
