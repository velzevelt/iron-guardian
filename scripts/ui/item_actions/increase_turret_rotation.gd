extends Node


func _init() -> void:
	if Globals.player:
		Globals.player.set_turret_speed(ItemOptions.get("increase_turret_rotation"))
