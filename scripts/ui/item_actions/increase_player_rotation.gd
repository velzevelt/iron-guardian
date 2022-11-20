extends Node


func _init() -> void:
	if Globals.player:
		Globals.player.rotation_speed += ItemOptions.get("increase_player_rotation")
