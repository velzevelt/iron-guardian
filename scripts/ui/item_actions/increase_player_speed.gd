extends Node


func _init() -> void:
	if Globals.player:
		Globals.player.speed += ItemOptions.get("increase_player_speed")
